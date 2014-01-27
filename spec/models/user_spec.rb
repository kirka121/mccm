require 'spec_helper'

describe User do
  
	before { @user = User.new(name: "Kirill afan", email: "kirka121@gmail.com", password: "nonknj", password_confirmation: "nonknj") }

	subject { @user }

	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:authenticate) }

	it { should be_valid }

	describe "when name is not present" do
		before { @user.name = " " }
		it { should_not be_valid }
	end

	describe "when name is too long" do
		before { @user.name = "a"*60 }
		it { should_not be_valid }
	end

	describe "when name is too short" do
		before { @user.name = "a"*3 }
		it { should_not be_valid }
	end

	describe "when email is not present" do
		before { @user.email = " " }
		it { should_not be_valid }
	end

	describe "when email is too short" do
		before { @user.email = "dd@dd.c" }
		it { should_not be_valid }
	end

	describe "when email is too long" do
		before { @user.email = "a"*160+"dd.c" }
		it { should_not be_valid }
	end

	describe "when email address is invalid" do
		it "should be invalid" do
			addresses = %w[user@foo,com user_at_foo.org example.user@foo.foo@bar_baz.com foo@bar+baz.com]

			addresses.each do |inv_addr|
				@user.email = inv_addr
				expect(@user).not_to be_valid
			end
		end
	end

	describe "when email address is valid" do
		it "should be invalid" do
			addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]

			addresses.each do |inv_addr|
				@user.email = inv_addr
				expect(@user).to be_valid
			end
		end
	end

	describe "when email address is already taken" do
		before do
			user_with_same_email = @user.dup
			user_with_same_email.email = @user.email.upcase
			user_with_same_email.save
		end

		it { should_not be_valid }
	end

	describe "when password is blank" do
		before { @user = User.new(name: "tester", email:"tester@tester.com", password: " ", password_confirmation: " ") }
		it { should_not be_valid }
	end

	describe "when password doesnt match" do
		before { @user.password_confirmation = "notthesame" }
		it { should_not be_valid }
	end

	describe "retrun value of authenticate method" do
		before { @user.save }
		let(:found_user) { User.find_by(email: @user.email) }

		describe "with valid password" do
			it { should eq found_user.authenticate(@user.password) }
		end

		describe "with invalid password" do
			let(:user_for_invalid_password) { found_user.authenticate("invalid") }

			it { should_not eq user_for_invalid_password }
			specify { expect(user_for_invalid_password).to be_false}
		end
	end

	describe "with a password that is too short" do
		before { @user.password = @user.password_confirmation = "a"*4 }
		it { should_not be_valid }
	end
end

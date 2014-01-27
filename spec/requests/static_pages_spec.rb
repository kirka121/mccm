require 'spec_helper'

describe "StaticPages" do
  
  describe "Home Page" do
  	before {visit root_path}

  	it "should have the content 'Welcome'" do
  		expect(page).to have_content('Welcome')
  	end

  	it "should have 'Home' in the title" do
  		expect(page).to have_title(full_title('Home'))
  	end
  end

  describe "Help Page" do
  	before {visit help_path}

  	it "should have the content 'Help'" do
  		expect(page).to have_content('Help')
  	end

  	it "should have 'Help' in the title" do
  		expect(page).to have_title(full_title('Help'))
  	end
  end
end

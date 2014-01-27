require 'spec_helper'

describe "StaticPages" do
  
  describe "Home Page" do
  	before {visit '/static_pages/home'}
  	
  	it "should have the content 'Welcome'" do
  		expect(page).to have_content('Welcome')
  	end

  	it "should have 'Home' in the title" do
  		expect(page).to have_title("MC Countermeasures Inc. - Home")
  	end
  end

  describe "Help Page" do
  	before {visit '/static_pages/help'}

  	it "should have the content 'Help'" do
  		expect(page).to have_content('Help')
  	end

  	it "should have 'Help' in the title" do
  		expect(page).to have_title("MC Countermeasures Inc. - Help")
  	end
  end
end

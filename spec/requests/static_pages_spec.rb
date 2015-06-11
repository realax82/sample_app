require 'spec_helper'

describe "StaticPages" do
#    let(:base_title) { "Ruby on Rails Tutorial Sample App" } 
# Вместо переменной base_title используется вызов метода full_title() из spec/support/utilities.rb
# before {visit <route_variable>} - позволяет указать один раз событие срабатывания для каждой из проверок
# subject{page} - дает возможность действиям выполняться в известном контексте (без явного указания it "<describing>" do expect(page).to <action>(<arg>))
    subject{page}

    describe "Home Page" do
	before {visit root_path}
	
        it {should have_content('Sample App')}
        it {should have_title(full_title(''))}
        it {should_not have_title("Home")}
    end
    describe "Help Page" do
	before {visit help_path}
	
	it {should have_content('Help')}
	it {should have_title(full_title('Help'))}
    end
    describe "About Page" do
	before {visit about_path}
	
	it {should have_content('About')}
	it {should have_title(full_title('About'))}
    end
    describe "Contact Page" do
	before {visit contact_path}
	
	it {should have_content('Contact')}
	it {should have_title(full_title('Contact'))}
    end
end

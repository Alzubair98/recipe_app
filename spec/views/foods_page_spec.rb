require_relative '../rails_helper'

RSpec.describe 'Food page', type: :feature do
    before(:each) do
      DatabaseCleaner.clean_with(:truncation)
      @user = User.create(
        name: 'Alzubair'
      )
      visit root_path
    end

    it 'shows the Log in button' do
        visit foods_path
        expect(page).to have_content("Add Food")
    end

    it 'shows the Log in button' do
        visit foods_path
        expect(page).to have_content("Here Is All The Food")
    end

    it 'should show the user name' do
        visit foods_path
        # user1 = User.find(@user.id)
        click_link("Add Food")
        expect(page.current_path).to eql(new_food_path )
      end
end
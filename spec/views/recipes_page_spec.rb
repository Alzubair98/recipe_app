require_relative '../rails_helper'

RSpec.describe 'Food page', type: :feature do
    before(:each) do
      DatabaseCleaner.clean_with(:truncation)
      @user = User.create(
        name: 'Alzubair',
        email: 'alzubair@gmail.com',
        password: '123456'
      )
      visit user_session_path
      fill_in 'Email', with: "#{@user.email}"
      fill_in 'Password', with: "#{@user.password}"
      find("input[type='submit']").click

      @recipe1 = Recipe.new(name: "Recipe1" , preparation_time: "1 hr", cooking_time: "1.5 hrs", description: "This recipe is super easy and every one can do it")
      @recipe1.user_id = @user.id
      @recipe1.save
    end

    it 'shows the Log in button' do
        visit recipes_path
        expect(page).to have_content("All Recipes")
    end
end
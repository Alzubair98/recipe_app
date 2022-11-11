require_relative '../rails_helper'

RSpec.describe 'home page', type: :feature do
    before(:each) do
      DatabaseCleaner.clean_with(:truncation)
      @user = User.create(
        name: 'Alzubair'
      )
      visit user_session_path
    end

    it 'shows the Log in button' do
        expect(page).to have_content("Log in")
    end
end
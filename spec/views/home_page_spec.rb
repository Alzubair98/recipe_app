require_relative '../rails_helper'

RSpec.describe 'home page', type: :feature do
  before(:each) do
    DatabaseCleaner.clean_with(:truncation)
    @user = User.create(
      name: 'Alzubair'
    )
    visit root_path
  end

  it 'should show the user name' do
    # user1 = User.find(@user.id)
    click_link('Recipe App')
    expect(page.current_path).to eql(root_path)
  end

  it 'shows the Logo in the navbar' do
    expect(page).to have_content('Recipe App')
  end

  it 'shows the Foods in the navbar' do
    expect(page).to have_content('Foods')
  end

  it 'shows the Recipes in the navbar' do
    expect(page).to have_content('Recipes')
  end

  it 'shows the Sign up button in the navbar' do
    expect(page).to have_content('Sign up!')
  end

  it 'shows the Sign in button in the navbar' do
    expect(page).to have_content('Sign in')
  end

  it 'shows the user name' do
    expect(page).to have_content(@user.name.to_s)
  end
  it 'should show the user name' do
    # user1 = User.find(@user.id)
    click_link('Sign in')
    expect(page.current_path).to eql(user_session_path)
  end

  it 'should show the user name' do
    # user1 = User.find(@user.id)
    click_link('Sign up!')
    expect(page.current_path).to eql(new_user_registration_path)
  end
end

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
    fill_in 'Email', with: @user.email.to_s
    fill_in 'Password', with: @user.password.to_s
    find("input[type='submit']").click

    @food1 = Food.new(name: 'banana', measurement_unit: 'kg', price: 2, quantity: 3)
    @food1.user_id = @user.id
    @food1.save
  end

  it 'shows the Log in button' do
    visit foods_path
    expect(page).to have_content('Add Food')
  end

  it 'shows the Log in button' do
    visit foods_path
    expect(page).to have_content('Here Is All The Food')
  end

  it 'should show the user name' do
    visit foods_path
    # user1 = User.find(@user.id)
    click_link('Add Food')
    expect(page.current_path).to eql(new_food_path)
  end

  it 'shows the user name' do
    expect(page).to have_content(@user.name.to_s)
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

  it 'shows the delete button for food in the navbar' do
    visit foods_path
    expect(page).to have_content('Delete')
  end

  it 'shows the delete button for food in the navbar' do
    visit foods_path
    expect(page).to have_content('Food')
  end

  it 'shows the Food filed for food in the navbar' do
    visit foods_path
    expect(page).to have_content('Food')
  end

  it 'shows the unit filed for food in the navbar' do
    visit foods_path
    expect(page).to have_content('Measurement_unit')
  end

  it 'shows the price button for food in the navbar' do
    visit foods_path
    expect(page).to have_content('Unit price')
  end

  it 'shows the Quantity button for food in the navbar' do
    visit foods_path
    expect(page).to have_content('Quantity')
  end

  it 'shows the Action button for food in the navbar' do
    visit foods_path
    expect(page).to have_content('Action')
  end

  it 'shows the user name' do
    visit foods_path
    expect(page).to have_content(@food1.name.to_s)
  end

  it 'shows the food unit' do
    visit foods_path
    expect(page).to have_content(@food1.measurement_unit.to_s)
  end

  it 'shows the food price' do
    visit foods_path
    expect(page).to have_content(@food1.price.to_s)
  end
  it 'shows the food quantity' do
    visit foods_path
    expect(page).to have_content(@food1.quantity.to_s)
  end
end

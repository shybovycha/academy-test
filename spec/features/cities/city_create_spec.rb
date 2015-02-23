include Warden::Test::Helpers
Warden.test_mode!

feature 'Creating a city', :devise do
  after(:each) do
    Warden.test_reset!
  end

  scenario 'user can create a city' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit new_city_path
    fill_in 'Name', :with => 'Kraków'
    fill_in 'Short name', :with => 'KRK'
    click_button 'Create City'
    expect(page).to have_content('City was created')
  end
end

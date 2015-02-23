include Warden::Test::Helpers
Warden.test_mode!

feature 'Edit city', :devise do
  after(:each) do
    Warden.test_reset!
  end

  scenario 'when user changes city name' do
    user = FactoryGirl.create(:user)
    city = FactoryGirl.create(:city)
    login_as(user, :scope => :user)
    visit edit_city_path(city)
    fill_in 'Name', :with => 'Kraków'
    fill_in 'Short name', :with => 'KRK'
    click_button 'Update City'
    expect(page).to have_content('City was updated')
  end
end

include Warden::Test::Helpers
Warden.test_mode!

feature 'Cities index page', :devise do
  before(:each) do
    city_names = [{ name: 'New York', short_name: 'NY' }, { name: 'Kraków', short_name: 'KRK' }, { name: 'Berlin', short_name: 'BRL' }]
    @cities = city_names.map { |names| FactoryGirl.create :city, names }

    @user = FactoryGirl.create(:user)
    login_as(@user, scope: :user)
  end

  after(:each) do
    Warden.test_reset!
  end

  scenario 'user sees all the cities' do
    visit cities_path

    @cities.each { |city| expect(page).to have_content city.name }
  end
end

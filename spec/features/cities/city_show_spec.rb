include Warden::Test::Helpers
Warden.test_mode!

feature 'Showing city', :devise do
  before(:each) do
    city_names = [{ name: 'New York', short_name: 'NY' }, { name: 'Kraków', short_name: 'KRK' }, { name: 'Berlin', short_name: 'BRL' }]
    @cities = city_names.map { |names| FactoryGirl.create :city, names }

    @user = FactoryGirl.create(:user)
    login_as(@user, scope: :user)
  end

  after(:each) do
    Warden.test_reset!
  end

  scenario 'user sees city details' do
    @cities.each do |city|
      visit city_path(city)
      expect(page).to have_content city.name
      expect(page).to have_content city.short_name
    end
  end
end

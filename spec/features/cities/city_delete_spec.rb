include Warden::Test::Helpers
Warden.test_mode!

feature 'Delete city', :devise, :js do
  after(:each) do
    Warden.test_reset!
  end

  scenario 'user can delete a city' do
    skip 'skip a slow test'
    user = FactoryGirl.create(:user)
    city = FactoryGirl.create(:city)
    login_as(user, :scope => :user)
    visit cities_path
    click_link "Delete #{ city.short_name }"
    expect(page).not_to have_content city.name
  end
end





feature 'adding links' do

  before(:each) do
   DatabaseCleaner.start
 end

  scenario 'link gets added to list' do
    visit('/links')
    click_button('Add New Link')
    fill_in 'title', with: "Facebook"
    fill_in 'url', with: "http://www.facebook.com"
    click_button('Add Link')

    within 'ul#links' do
      expect(page).to have_content("http://www.facebook.com")
    end
  end
  after(:each) do
    DatabaseCleaner.clean
  end
end

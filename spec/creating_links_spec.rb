require 'database_cleaner'

feature 'adding links' do

  scenario 'link gets added to list' do
    visit('/links')
    click_button('Add New Link')
    fill_in 'title', with: 'Facebook'
    fill_in 'url', with: 'http://www.facebook.com'
    click_button('Add Link')

    within 'ul#links' do
      expect(page).to have_content('http://www.facebook.com')
    end
  end
end

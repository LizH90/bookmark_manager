require 'database_cleaner'


RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end


  config.after(:each) do
    DatabaseCleaner.clean
  end

end

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

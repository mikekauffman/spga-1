require 'spec_helper'
require 'capybara/rspec'

Capybara.app = Application

feature 'Homepage' do
  scenario 'Dogs can be added to the database' do
    visit '/'

    expect(page).to have_content 'Welcome!'
    click_on 'Add a Dog'

    fill_in 'dog_breed', with: 'Rottweiler'
    fill_in 'dog_color', with: 'Black and Tan'
    fill_in 'dog_size', with: 'Large'
    click_on 'Submit'

    expect(page).to have_content 'Rottweiler'
    expect(page).to have_content 'Black and Tan'
    expect(page).to have_content 'Large'
  end
end
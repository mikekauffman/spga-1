require 'spec_helper'
require 'capybara/rspec'

Capybara.app = Application

feature 'Homepage' do
  scenario 'Dogs can be added to the database, edited and deleted' do
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

    visit '/'

    click_on 'Add a Dog'

    fill_in 'dog_breed', with: 'Vizsla'
    fill_in 'dog_color', with: 'Cinnamon'
    fill_in 'dog_size', with: 'Medium/Large'
    click_on 'Submit'

    click_on 'view Vizsla'

    fill_in 'dog_breed', with: 'Vizsla'
    fill_in 'dog_color', with: 'Cinnamon'
    fill_in 'dog_size', with: 'Medium'
    click_on 'Submit'

    expect(page).to have_content 'Rottweiler'
    expect(page).to have_content 'Black and Tan'
    expect(page).to have_content 'Large'
    expect(page).to have_content 'Vizsla'
    expect(page).to have_content 'Cinnamon'
    expect(page).to have_content 'Medium'

    click_on 'view Vizsla'
    click_on 'delete Vizsla'

    expect(page).to have_content 'Rottweiler'
    expect(page).to have_content 'Black and Tan'
    expect(page).to have_content 'Large'
    expect(page).to_not have_content 'Vizsla'

  end
end
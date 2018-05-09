require_relative '../../app.rb'
require 'spec_helper'
require 'pg'

feature 'Adding a new bookmark' do
  scenario 'User adds a new bookmark to Bookmark Manager' do
    visit '/bookmarks/new'
    fill_in('url', with: 'http://testbookmark.com')
    fill_in('title', with: 'test')
    click_button('Submit')
    expect(page).to have_content 'test'
    end

  scenario 'User tries to add an invalid url to Bookmark Manager' do
    visit '/bookmarks/new'
    fill_in('url', with: 'not a valid url')
    click_button('Submit')
    expect(page).not_to have_content "not a valid url"
    expect(page).to have_content "invalid url"
  end
  end

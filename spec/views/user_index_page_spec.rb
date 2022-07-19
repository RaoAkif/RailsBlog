require 'rails_helper'

RSpec.describe 'User Index Page', type: :feature do
  before(:each) do
    @akif = User.create(name: 'Akif', photo: 'http://www.photo.png', bio: 'Hello World, I am Akif')
    @fdennis = User.create(name: 'Dennis', photo: 'http://www.photo.png', bio: 'Hello World, I am Dennis')
    visit root_path
  end

  it 'shows the username' do
    expect(page).to have_content(@akif.name)
    expect(page).to have_content(@fdennis.name)
  end

  it 'shows the users\' photo' do
    image = page.all('img')
    expect(image.size).to eql(2)
  end

  it 'shows the user\'s post counter' do
    expect(page).to have_content('Number of posts: 0')
  end

  it 'redirects to the user\'s show page when clicked' do
    click_on 'Akif'
    expect(page).to have_current_path user_path(@akif)
    expect(page).to have_content('Hello World, I am Akif')
  end
end

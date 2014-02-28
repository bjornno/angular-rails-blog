require 'spec_helper'

Capybara.default_driver = :selenium
Capybara.default_wait_time = 10

describe 'smoketest' do
	before { pending "Excluded running features as they run in browser"}

  it 'creates a blog post' do
    visit '/'
		page.should have_title('Blog')
    find("#new_post").click
    expect(page).to have_content 'Create new post'
    fill_in 'title', with: 'blog title'
    fill_in 'contents', with: 'blog contents'
    click_on 'Create'
    expect(page).to have_content 'Posts'
    expect(page).to have_content 'blog title'
    expect(page).to have_content 'blog contents'
    find('a', :text => 'blog title').click
    click_on 'Delete'
    expect(page).to have_no_content 'blog title'
    
  end
end
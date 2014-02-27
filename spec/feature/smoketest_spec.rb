require 'spec_helper'

Capybara.default_driver = :selenium
describe 'smoketest' do
#	before { pending "Excluded running features as they run in browser"}

  it 'creates a blog post' do
    visit '/'
		page.should have_title('Blog')
    click_on 'new post'
    expect(page).to have_content 'Create new post'
    fill_in 'title', with: 'blog title'
    fill_in 'contents', with: 'blog contents'
    click_on 'Create'
    expect(page).to have_content 'Posts'
    expect(page).to have_content 'blog title'
    expect(page).to have_content 'blog contents'
    click_on 'blog title'
    click_on 'Delete'
    expect(page).to have_no_content 'blog title'
    
  end
end
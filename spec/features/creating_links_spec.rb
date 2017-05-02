feature 'Add new links the front page' do
  scenario 'Adds a new link' do
    visit '/links/new'
    fill_in :site_name, with: "Youtube"
    fill_in :site_url, with: 'https://www.youtube.com/'
    click_button "Add link"
    visit '/links'
    expect(page).to have_content 'Youtube'
  end
end

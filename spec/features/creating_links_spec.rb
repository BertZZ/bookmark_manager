feature 'Add new links the front page' do
  scenario 'Adds a new link with a tag' do
    visit '/links/new'
    fill_in :site_name, with: "Youtube"
    fill_in :site_url, with: 'https://www.youtube.com/'
    fill_in :tag, with: 'Entertainment'
    click_button "Add link"
    visit '/links'
    link = Link.first
    expect(page).to have_content 'Youtube'
    expect(link.tags.map(&:name)).to include('Entertainment')
  end
end

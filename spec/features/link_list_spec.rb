require_relative '../../app/models/link'
feature 'See links' do
  scenario 'I can see links on the web page' do
    Link.create(url: 'http://www.bbc.co.uk/news', title: 'BBC News')
    visit('/links')
    expect(page)
    expect(page).to have_content('BBC News')
  end
end

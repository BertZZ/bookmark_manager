feature 'Viewing links' do
  scenario 'I can see existing links on the links page' do
    Link.create(url: 'http://www.bbc.co.uk/news', title: 'BBC News')
    visit '/links'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('BBC News')
    end
  end
end

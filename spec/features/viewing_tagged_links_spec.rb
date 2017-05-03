feature 'Views list of links with the same tag' do
  scenario "Shows list of tagged links" do
    visit_and_create_bookmark
    visit '/tags/entertainment'
    expect(page).to have_content('Youtube')
  end
  scenario 'Does not show links without the tag' do
    visit_and_create_game_site
    visit '/tags/entertainment'
    expect(page).not_to have_content('IGN')
  end
end

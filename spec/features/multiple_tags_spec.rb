feature 'Views list of links with the multiple tags' do
  scenario "Shows list of multi-tagged links" do
    create_user
    visit_and_create_multi_tag
    visit '/tags/entertainment'
    expect(page).to have_content('Youtube')
    visit '/tags/videos'
    expect(page).to have_content('Youtube')
  end
end

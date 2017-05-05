require 'pry'
feature "Adding a new user account" do
  scenario "Adds a new user to the Database" do
    visit '/new_user'
    fill_in :email, with: "user.name@user.com"
    fill_in :password, with: "Password"
    click_button "Create Account"
    user = User.last
    expect(user.email).to eq('user.name@user.com')
    expect(page).to have_current_path("/links")
    expect(page).to have_content("Welcome user.name@user.com")
    expect { create_user }.to change { User.all.count }.by 1
  end
end

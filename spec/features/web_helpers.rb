def visit_and_create_bookmark
  visit '/links/new'
  fill_in :site_name, with: "Youtube"
  fill_in :site_url, with: 'https://www.youtube.com/'
  fill_in :tag, with: 'entertainment'
  click_button "Add link"
end

def visit_and_create_game_site
  visit '/links/new'
  fill_in :site_name, with: "IGN"
  fill_in :site_url, with: 'https://www.ign.com/'
  fill_in :tag, with: 'Games'
  click_button "Add link"
end

def visit_and_create_multi_tag
  visit '/links/new'
  fill_in :site_name, with: "Youtube"
  fill_in :site_url, with: 'https://www.youtube.com/'
  fill_in :tag, with: 'entertainment, videos'
  click_button "Add link"
end

def create_user
  visit '/new_user'
  fill_in :email, with: "User.name@user.com"
  fill_in :password, with: "Password"
  click_button "Create Account"
end

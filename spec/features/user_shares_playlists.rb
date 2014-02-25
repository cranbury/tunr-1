require 'spec_helper'

describe "a user can share a playlist" do
  
  subject(:user) { create(:user) }
  let(:shared_with_user) { create(:shared_with)}
  let(:not_shared_with_user) { create(:not_shared_with)} 
  binding.pry
  login(user)

  @playlist = user.playlists.create(title: "party-time")

  visit(playlist_path(@playlist))
  
  it "should allow the original creator to visit the page" do
    expect(page).to have_content @playlist.title
  end

  select 'shared_with_user.first_name', from: 'users'

  click_button "Submit"

  click_button "Log out #{user.first_name}!"

  login(shared_with_user)

  visit(playlist_path(@playlist))

  it "should allow the person shared with to visit the page" do
    expect(page).to have_content @playlist.title
  end

  click_button "Log out #{shared_with_user.first_name}!"

  login(not_shared_with_user)

  visit(playlist_path(@playlist))

  it "should not allow a random person to visit the page" do
    expect(page).to_not have_content @playlist.title
  end


  def login(user)
    visit "/login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log in!"
  end

end

  #login(creator)
  # add one user to shared
  # visit the playlist -- expect creator to see 
  # logout
  #login user(shared user)
  #visit playlist -- expect they can see playlist
  #logout
  #login user(not shared user)
  #visit playlist show page -- expect not to see it
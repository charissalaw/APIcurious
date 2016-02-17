require 'rails_helper'

RSpec.feature "user_sees_dashboard" do
  scenario "user can view basic profile info" do
    user = User.new(name:"TumblrUser", avatar:"")
    visit dashboard_path
    expect(page).to have_content()
    expect(page).to have_css(avatar:"")
  end

end

class DashboardController < ApplicationController

  def show
    @posts = blog_service(current_user).posts
    # imageurl post["photos"][0]["alt_sizes"][0]["url"]
  end
end

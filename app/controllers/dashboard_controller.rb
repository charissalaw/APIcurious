class DashboardController < ApplicationController

  def show
    @posts = blog_service(current_user).posts
  end
end

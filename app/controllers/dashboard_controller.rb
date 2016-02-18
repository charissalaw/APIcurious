class DashboardController < ApplicationController
  
  def show
    @posts = blog_service.posts
  end
end

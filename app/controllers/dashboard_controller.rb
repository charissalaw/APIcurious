class DashboardController < ApplicationController

  def show
    @posts = blog_service(current_user).posts
  end

  def update
    blog_service(current_user).like(params["post_id"], params["reblog_key"])
    flash[:notice] = "You liked this post"
    redirect_to dashboard_path
  end
end

class DashboardController < ApplicationController

  def show
    @posts = blog_service.posts
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end
end

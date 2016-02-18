class DashboardController < ApplicationController

  def show
    binding.pry
    @posts = User.posts
  end
end

class FeedController < ApplicationController

  def show
    @following = blog_service(current_user).following["blogs"]
  end

  def update
    if params["method"] == "reblog"
      blog_service(current_user).reblog(params["post_id"], params["reblog_key"])
      flash[:notice] = "You reblogged a post"
    else
      blog_service(current_user).like(params["post_id"], params["reblog_key"])
      flash[:notice] = "You liked this post"
    end
    redirect_to feed_path
  end


end

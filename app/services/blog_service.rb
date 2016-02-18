class BlogService

  attr_reader :current_user, :api_key

  def initialize(current_user)
    @api_key = ENV["TUMBLR_KEY"]
    @current_user = current_user
  end

  def posts
    api_data = Faraday.get("https://api.tumblr.com/v2/blog/#{current_user.blog_name}.tumblr.com/posts?api_key=#{api_key}").body
    parsed_data = JSON.parse(api_data)
    parsed_data["response"]["posts"]
  end

  def reblog
    #built into tumblr, make it a button and it should end up in the posts section
  end

  def like
    # built into tumblr, make button and
    # needs Oauth, so do curren_user.token somehow
  end

  private


end

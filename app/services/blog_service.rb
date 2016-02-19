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
    api_data = Faraday.post("https://api.tumblr.com/v2/blog/#{current_user.blog_name}.tumblr.com/post/reblog").body
    binding.pry
  end

  def like(post_id, reblog_key)
    # built into tumblr, make button and
    # needs Oauth, so do curren_user.token somehow
    # Authenticate via OAuth
    client = Tumblr::Client.new({
      :consumer_key => ENV["TUMBLR_KEY"],
      :consumer_secret => ENV["TUMBLR_SECRET"],
      :oauth_token => current_user.token,
      :oauth_token_secret => current_user.secret
    })
    #Make the request
    client.like post_id.to_i, reblog_key

    #when i click a like button on the post, call this method

  end

  private


end

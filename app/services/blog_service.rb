class BlogService

  attr_reader :current_user, :api_key, :client

  def initialize(current_user)
    @api_key = ENV["TUMBLR_KEY"]
    @current_user = current_user
    # Authenticate via OAuth
    @client = Tumblr::Client.new({
      :consumer_key => ENV["TUMBLR_KEY"],
      :consumer_secret => ENV["TUMBLR_SECRET"],
      :oauth_token => current_user.token,
      :oauth_token_secret => current_user.secret
    })
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
    client.like post_id.to_i, reblog_key
  end

  def following
    client.following
  end

  def new_posts(blog_name)
    short_name = blog_name[7..-2]
    client.posts short_name, :limit => 3, :reblog_info => true
  end

  def reblog(post_id, reblog_key)
    client.reblog "#{current_user.blog_name}.tumblr.com", :id => post_id.to_i, :reblog_key => reblog_key
  end

  def embed(youtube_url)
    youtube_id = youtube_url.split("=").last
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
  end

end

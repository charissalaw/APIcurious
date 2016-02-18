class BlogService

  attr_reader :current_user, :api_key

  def initialize(current_user)
    @api_key = ENV["TUMBLR_KEY"]
    @current_user = current_user
    # @myClient = Tumblr::Client.new(
    #   :consumer_key => 'rmA672Cn6P5snyMGQ4ZIaqhsqwTvtujLZ7ww9JAP9tp3PPQvGs',
    #   :consumer_secret => 'P3Ou1Mnckda4Kxb7hULLTB8J0IDLsDeXIK9UCmkkpmIVI03ZY2',
    #   :oauth_token => 'Fbi6QlK2hggAFYFDfQIzhvUK6sKRn2RuoKxoEY4Yu2CMXLzCYX',
    #   :oauth_token_secret => 'dt44BmXEOrIP8Ect7aQvvNumeMvqcyDuvEHUtdz9jLi4SDnXG8'
    # )
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

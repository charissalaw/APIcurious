class User < ActiveRecord::Base

  def self.find_or_create_by_auth(auth)
    user = User.find_or_create_by(provider: auth['provider'], uid: auth['uid'])

    user.nickname = auth["info"]["nickname"]
    user.name = auth["info"]["name"]
    user.blog_name = auth["info"]["blogs"][0]["name"]
    user.blog_url = auth["info"]["blogs"][0]["url"]
    user.avatar = auth["info"]["avatar"]
    user.token = auth["credentials"]["token"]
    user.secret = auth["credentials"]["secret"]

    user.save
    user
  end

  def self.service
    BlogService.new
  end

  def self.posts
    service.posts
  end

  # def self.all
  #   service.client.map {|client| build_object(client)}
  #   binding.pry
  # end

  private

    def self.build_object(data)
      OpenStruct.new(data)
      #instead of doing all.first.title
    end

end

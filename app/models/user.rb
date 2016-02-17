class User < ActiveRecord::Base

  def self.find_or_create_by_auth(auth)
    user = User.find_or_create_by(provider: auth['provider'], uid: auth['uid'])

    user.nickname = auth["info"]["nickname"]
    user.name = auth["info"]["name"]
    user.blog_name = auth["info"]["blogs"][0]["name"]
    user.blog_url = auth["info"]["blogs"][0]["url"]
    user.avatar = auth["info"]["avatar"]
    user.token = auth["credentials"]["token"]

    user.save
    user

  end

end

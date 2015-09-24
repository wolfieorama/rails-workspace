# class User < ActiveRecord::Base
#   def self.find_or_create_by_auth(auth_data)
#     find_or_create_by_provider_and_uid(auth_data["provider"], auth_data["uid"],
#                                      name: auth_data["info"]["name"])
#   end
# end


class User < ActiveRecord::Base
  def self.find_or_create_by_auth(auth_data)
    user = where(provider: auth_data[:provider], uid: auth_data[:uid]).first_or_create
    user.update(
        name: auth_data[:info][:name]
        )
  end
end

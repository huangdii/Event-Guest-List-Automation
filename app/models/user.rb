class User < ApplicationRecord
    has_secure_password
        # User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
        #   u.username = auth['info']['name']
        #   u.email = auth['info']['email']
        # #   u.password = SecureRandom.hex(16)
        # end
    # def self.from_omniauth(access_token)
    #     use = User.where(email: access_token.info.email).first
    #     unless user
    #         user = User.create(
    #             email: access_token.info.email,
    #             password: Devise.friendly_token[0,20]
    #         )
    #     end
    #     user.name = access_token.info.name
    #     user.image = access_token.info.image
    #     user.uid = access_token.uid
    #     user.provider = access_token.provider
    #     user.save
    
end

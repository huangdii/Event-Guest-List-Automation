class SessionsController < ApplicationController
   #logging a user in, logging a user out, omniauth
   
   def omniauth  #log users in with omniauth
    #   binding.pry
        # user = User.create_from_omniauth(auth)
        user = User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.username = auth['info']['name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(16)
        end
        if user.valid?
            session[:user_id] = user.id
            redirect_to root_path
        else
            flash[:message] = user.erros.full_messages.join(", ")
            redirect_to root_path
        end
           
   end
   
   private
   def auth
       request.env['omniauth.auth']
   end
end
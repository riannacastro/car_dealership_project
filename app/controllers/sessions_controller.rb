class SessionsController < ApplicationController
    
    def welcome
    end

    def new
    end

    def create
        u = User.find_by_email(params[:user][:email])
        if u
    end

    def omniauth
       user = User.find_or_create_by(uid: auth['uid'],  provider:  auth['provider']) do |u|
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(22)
        end
        if user.valid?
            session[:user_id] = user.id
            flash[:message] = "Successful Login!"
            redirect_to cars_path
        else
        end

       # byebug
    end

    def destroy
        session.delete(:user_id)
        redirect_to cars_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end


end
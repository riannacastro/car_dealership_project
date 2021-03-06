class SessionsController < ApplicationController
    
    def home
        render :"layouts/home"
    end

    def new
    end

    def create
        user = User.find_by_email(params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:message] = "Invalid Email or Password."
            redirect_to login_path
        end

    end

    def omniauth
       user = User.find_or_create_by(uid: auth['uid'],  provider:  auth['provider']) do |u|
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(22)
        end
        if user.valid?
            session[:user_id] = user.id
            flash[:message] = "Successful Login!"
            redirect_to user_path(user)
        else
        end

       
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

class ApplicationController < ActionController::Base
    include ApplicationHelper
    include CarsHelper

    private

    def redirect_if_not_logged_in?
        redirect_to root_path if !logged_in?
    end

    def redirect_if_not_authorized
        @user = User.find(params[:id])
        if @user != current_user
            redirect_to cars_path(car)
        end
    end

end

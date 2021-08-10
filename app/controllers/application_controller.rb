class ApplicationController < ActionController::Base
    include ApplicationHelper
    include CarsHelper

    private

    def redirect_if_not_logged_in?
        redirect_to login_path if !logged_in?
    end

end

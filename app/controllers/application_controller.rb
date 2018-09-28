class ApplicationController < ActionController::Base
    include SessionsHelper

    def admin_user
        redirect_to root_path unless is_admin?
    end
end

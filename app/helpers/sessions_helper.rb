module SessionsHelper
    def sign_in(user)
        cookies.permanent[:user_id] = user.id
        current_user = user
    end

    def sign_out
        cookies.delete :user_id
        current_user = nil
    end

    def current_user
        if cookies[:user_id]
            current_user ||= User.find_by(id: cookies[:user_id])
        else
            return nil
        end
    end

    def logged_in?
        !cookies[:user_id].nil?
    end

    def current_user?(user)
        if logged_in? && current_user == user || logged_in? && current_user.is_admin
            return true
        else
            return false
        end
    end

    def is_admin?
        !current_user.nil? && current_user.is_admin
    end
end

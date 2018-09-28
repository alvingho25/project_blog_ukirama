class SessionsController < ApplicationController
    def login
    end

    def create
        user = User.find_by(email: params[:session][:email])
        if user && user.authenticate(params[:session][:password])
            sign_in(user)
            flash[:success] = "Successfully Login"
            redirect_to root_path
        else
            flash.now[:danger] = "Login Failed! Please check your email or password"
            render :new
        end
    end

    def delete
        sign_out
        flash[:success] = "Log Out Successfully"
        redirect_to root_path
    end
end

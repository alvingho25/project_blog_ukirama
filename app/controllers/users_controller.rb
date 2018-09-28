class UsersController < ApplicationController
    before_action :check_permission, only: [:show, :edit, :update, :destroy]
    before_action :admin_user, only: :index

    def index
        # @users = User.paginate(page: params[:page], :per_page => 5)
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
            flash[:success] = "Edit Succesfull"
            redirect_to user_path
        else
            flash.now[:danger] = "Edit Failed please try again"
            render :edit
        end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            sign_in(@user)
            redirect_to user_path(@user)
        else
            flash.now[:danger] = "Sign Up Failed please try again"
            render :new
        end
    end

    def destroy
        user = User.find(params[:id])
        if current_user == user
            sign_out
        end
        user.destroy
        flash[:success] = "User deleted"
        redirect_to root_path
    end

    private

    def check_permission
        user = User.find(params[:id])
        if current_user?(user)
            return true
        else
            flash[:danger] = "You don't have permission to do that"
            redirect_to root_path
        end
    end

    def user_params
        # jika user mau update biasa maka permit name dan email,
        # jika user mau update password maka permit password dan password confirmation juga
        # jika user adalah admin maka permit name, email dan is_admin untuk user lain
        # jika user adalah admin dan change password sendiri maka permit password dan password confirmation juga
        if params[:user][:password].blank? && !is_admin?
            params.require(:user).permit(:name, :email)
        elsif !params[:user][:password].blank?
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        else is_admin?
            params.require(:user).permit(:name, :email, :is_admin)
        end
    end
end

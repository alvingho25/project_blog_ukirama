class UsersController < ApplicationController
    def index
        @users = User.paginate(page: params[:page], :per_page => 5)
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:success] = "Edit Succesfull"
            redirect_to user_path
        else
            render :edit
        end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to users_path
        else
            render :new
        end
    end

    def destroy
        User.find(params[:id]).destroy
        flash[:success] = "User deleted"
        redirect_to users_path
    end

    private
    def user_params
        params.require(:user).permit(:name, :email)
    end
end

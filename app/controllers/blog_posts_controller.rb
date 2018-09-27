class BlogPostsController < ApplicationController
    def index
        @posts = User.find(params[:user_id]).blog_posts.order(created_at: :desc)
    end

    def all_post
        @posts = BlogPost.all.order(created_at: :desc)
    end

    def post
        @post = BlogPost.find(params[:id])
    end

    def show
        @user = User.find(params[:user_id])
        @post = @user.blog_posts.find(params[:id])
    end

    def destroy
        @user = User.find(params[:user_id])
        @post = @user.blog_posts.find(params[:id])
        @post.destroy
        flash[:success] = "Post Deleted Hope you know what you just do"
        redirect_to user_blog_posts_path(@user)
    end

    def edit
        @user = User.find(params[:user_id])
        @post = @user.blog_posts.find(params[:id])
    end

    def update
        @user = User.find(params[:user_id])
        @post = @user.blog_posts.find(params[:id])
        if @post.update(post_params)
            flash[:success] = "Edit Succesfull"
            redirect_to user_blog_posts_path
        else
            render :edit
        end
    end

    def new
        @user = User.find(params[:user_id])
        @post = @user.blog_posts.new
    end

    def create
        @user = User.find(params[:user_id])
        @post = @user.blog_posts.create(post_params)
        if @post.valid?
            flash[:success] = "Hey!! Is that a new Post??"
            redirect_to user_blog_posts_path
        else
            render :new
        end
    end

    private

    def post_params
        params.require(:blog_post).permit(:title, :summary, :content)
    end
end

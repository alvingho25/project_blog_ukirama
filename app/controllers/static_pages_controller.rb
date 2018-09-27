class StaticPagesController < ApplicationController
    def index
        @posts = BlogPost.order(created_at: :desc).limit(5)
    end

    def about
    end

    def blog_post
        @posts = BlogPost.all.order(created_at: :desc)
    end

    def contact
    end
end

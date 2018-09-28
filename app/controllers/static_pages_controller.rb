class StaticPagesController < ApplicationController
    def index
        @posts = BlogPost.order(created_at: :desc).limit(10)
    end

    def search
        if params['search']
            @posts = BlogPost.where("title ILIKE :query OR summary ILIKE :query", query: "%#{params['search']}%").order(created_at: :desc)
        else
            @posts = BlogPost.order(created_at: :desc).limit(10)
        end
        render 'index'
    end

    def about
    end

    def blog_post
        @posts = BlogPost.all.order(created_at: :desc)
    end

    def contact
    end
end

class StaticPagesController < ApplicationController
    require 'pry'
    def index
        binding.pry
    end

    def about
    end

    def sample_blog_post
    end

    def contact
    end
end

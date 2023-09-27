class Admin::PostsController < ApplicationController
    before_action :if_not_admin
    before_action :set_post, only: [:new, :create, :edit]

    private
    def if_not_admin
        redirect_to root_path unless current_user.admin?
    end

    def set_post
        @post = Post.new
    end

    def post_params
        params.require(:post).permit(:name, :member, :age, :team, :origin, :movie, :genre, :image) 
    end
end
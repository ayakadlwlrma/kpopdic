class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    def index
        if params[:search] == nil
            @posts= Post.all
        elsif params[:search] == ''
            @posts= Post.all
        else
            @posts = Post.where("name LIKE ? ",'%' + params[:search] + '%')
        end
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id

        url = params[:post][:movie]
        url = url.last(11)
        @post.movie = url

        if @post.save
            p params[:post][:photos]
            params[:post][:photos]&.each do |image|
                p image
                Image.create!(photo: image, post_id: @post.id)
            end
            redirect_to :action => 'index'
        else
            redirect_to :action => 'new'
        end
    end

    def show
        @post = Post.find(params[:id])
        @comments = @post.comments
        @comment = Comment.new
    end

    def edit
        @post = Post.find(params[:id])
    end
    
    def update
        post = Post.find(params[:id])
        post.update params.require(:post).permit(:name, :member, :age, :team, :origin, :movie, :genre, :image, :icon, memberimg: [])  #prams.require(:モデル名).permit(:カラム名)
        
        if post.update(post_params)
            redirect_to :action => "show", :id => post.id
        else
            redirect_to :action => "new"
        end
    end

    def destroy
        post = Post.find(params[:id])
        post.destroy
        redirect_to action: :index
    end

    def boy
        @posts = Post.order(age: :desc) 
    end
    
    def girl
        @posts = Post.order(age: :desc)
    end

    def team
        @posts = Post.order(age: :desc)
    end

    def SM
        @posts = Post.all
    end

    def JYP
        @posts = Post.all
    end

    def YG
        @posts = Post.all
    end

    def HYBE
        @posts = Post.all
    end

    def other
        @posts = Post.all
    end

    def age
        @posts = Post.order(age: :desc)
    end

    def anzu
    end

    
    private
    def post_params
        params.require(:post).permit(:name, :member, :age, :team, :origin, :movie, :genre, :image, :icon, memberimg: [])  #prams.require(:モデル名).permit(:カラム名)
    end
end

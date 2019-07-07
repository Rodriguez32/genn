class PostsController < ApplicationController
    def Index
    end
    
    def new
        @Post = Post.new
    end
    
    def create
        @Post = Post.new(post_params)
        
        if post.save
            redirect_to @post
        else
            render 'new'
        end
    end
    
    private
    
    def post_params
        params.require(:post).permit(:title, :summary, :sector, :region, :type, :user_id)
    end
    
    def show
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])

        if @post.update(post_params)
            redirect_to @post
        else
            render 'edit'
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy

        redirect_to posts_path

    end

    private

    def post_params
        params.require(:post).permit(:title, :content)
    end

end
    

class PostsController < ApplicationController
    
    def Index
        @posts = Post.all.order("created_at DESC")
    end
    
    def new
        @post = Post.new
    end
    
   def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

     def show
        @post = Post.find(params[:id])
     end

    
    def post_params
        params.require(:post).permit(:title, :summary, :sector, :region, :type, :user_id)
    end
    
   

    def update

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
        params.require(:post).permit(:title, :summary)
    end

end
    

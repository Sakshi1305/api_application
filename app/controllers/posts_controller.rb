class PostsController < ApplicationController

	def index
		@posts = Post.all
		render json: @posts
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			render json: @post
		else
			render json: {error: "Post not created"}, status: 400
		end
	end

	def update
		@post = Post.find(params[:id])
		if @post
			@post.update(post_params)
			render json: @post
		else
			render json: {error: "Post not updated"}, status: 400
		end
	end

	def show
		@post = Post.find(params[:id])
		if @post
			render json: @post
		else
			render json: {error: "Post not found"}, status: 400
		end
	end


	def destroy
		@post = Post.find(params[:id])
		if @post
			@post.destory
			render json: {message: "Post deleted successfully"}, status: 200
		else
			render json: {error: "Not deleted"}, status: 400
		end
	end

	private

	def post_params
		params.require(:post).permit(:name)
	end
end

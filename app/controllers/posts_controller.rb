class PostsController < ApplicationController
  def index
    @posts = Post.all # retrieve all the Post data, and store them in the variable @posts
  end

  def create
    @post = Post.new(post_params)

    @post.save
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category)
  end
end

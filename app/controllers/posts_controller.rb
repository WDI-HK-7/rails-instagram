class PostsController < ApplicationController
  def index
    @posts = Post.all # retrieve all the Post data, and store them in the variable @posts
  end
end

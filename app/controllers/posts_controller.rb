class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.includes(:comments) # retrieve all the Post data, and store them in the variable @posts
  end

  def create
    @post = current_user.posts.new(post_params)

    @post.save
  end

  def update
    @post = Post.find_by_id(params[:id])

    if @post.nil?
      render :json => {
        :message => { :message => "Cannot find post", :updated => false }
      }
    else
      @post.update(post_params)
    end
  end

  def show
    @post = Post.find_by_id(params[:id])
    
    if @post.nil?
      render :json => {
        :message => { :message => "Cannot find post" }
      }
    end
  end

  def destroy
    @post = Post.find_by_id(params[:id])

    if @post.nil?
      render :json => {
        :message => { :message => "Cannot find post", :deleted => false }
      }
    else
      if @post.destroy
        render :json => {
          :message => { :message => "Successful", :deleted => true }
        }
      else
        render :json => {
          :message => { :message => "Unsuccessful", :deleted => false }
        }
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category, :picture)
  end
end

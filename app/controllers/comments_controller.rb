class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @post = current_user.comments.new(comment_params)

    if @post.save
      render :json => {
        :message => { :message => "Successful", :saved => true }
      }
    else
      render :json => {
        :message => { :message => "Unsuccessful", :saved => false }
      }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end

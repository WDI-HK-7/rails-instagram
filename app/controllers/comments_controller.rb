class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      PrivatePub.publish_to "/comments/new", :data => {
        :comment=> @comment,
        :post_id => @comment.post_id
      }

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

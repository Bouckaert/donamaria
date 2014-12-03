class CommentsController < ApplicationController

def index
  @proposal = Proposal.find(params[:proposal_id])
  @user = current_user
  @comments = @proposal.comments.all
  @candidature = Candidature.find(@proposal.candidature_id)
end

def new
  @comment = Comment.new
end


def create
  @proposal = Proposal.find(params[:proposal_id])
  @user = current_user
  @comment=Comment.new(comment_params)
  @comment.user_id = @user.id
  @comment.proposal_id = @proposal.id
  if @comment.save
    redirect_to candidates_path
    flash[:success] = "comment cadastrada com sucesso!"
  else
        redirect_to candidates_path

      flash[:error] = @comment.errors.full_messages_for(@comment.errors.first.first)
  end

# @commentable = params[:comment][:commentable_type].constantize.find(params[:comment][:commentable_id])
# @comment.commentable = @commentable
# redirect_to [commentable.user, commentable]
end


private

def comment_params
    params.require(:comment).permit(:body, :proposal_id, :user_id)
end

end

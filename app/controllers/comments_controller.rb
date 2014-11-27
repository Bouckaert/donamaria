class CommentsController < ApplicationController

def index
  @proposal = Proposal.find(params[:proposal_id])
  @user = current_user
  @comments = @proposal.comments.all
 # @comments = User.find(current_user).comments.all
 # @p = User.find(current_user).comments.proposals.all
end

def new
  @comment = Comment.new
end


def create
  @proposal = Proposal.find(params[:proposal_id])

  @comment = @proposal.comments.create(comment_params)
# @commentable = params[:comment][:commentable_type].constantize.find(params[:comment][:commentable_id])
# @comment.commentable = @commentable
# @user = current_user
# @comment.user = @user
# @comment.proposal = @proposal

# if @comment.save
# redirect_to '/proposals'
# flash[:success] = "Proposta cadastrada com sucesso!"
# else
#   flash[:error] = @proposal.errors.full_messages_for(@proposal.errors.first.first)
# end


# puts @comment.inspect



# redirect_to '/proposals'

  #redirect_to [commentable.user, commentable]
end


private

def comment_params
    params.require(:comment).permit!
end

end

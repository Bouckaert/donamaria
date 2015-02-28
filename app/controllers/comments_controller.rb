class CommentsController < ApplicationController
  #TODO verificar se a action index é utilizada
  def index
    @proposal = Proposal.find(params[:proposal_id])
    @user = current_user
    @comments = @proposal.comments.all
    # TOFIX Proposal não tem mais associação com candidatura
    @candidature = Candidature.new #Candidature.find(@proposal.candidature_id)
  end

  def new
    @comment = Comment.new
  end

  def create
    @proposal = Proposal.find(params[:proposal_id])
    @user = current_user
    @comment = Comment.new(comment_params)
    @comment.user = @user
    @comment.proposal = @proposal
    if @comment.save
      redirect_to representative_path(@proposal.representative)
      flash[:success] = "comment cadastrada com sucesso!"
    else
      redirect_to current_user_path
      flash[:error] = @comment.errors.full_messages_for(@comment.errors.first.first)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :proposal_id, :user_id)
  end
end

class ProposalsController < ApplicationController
  def index
    @proposals = Proposal.all
  end

  def new
    @proposal = Proposal.new
  end

  def create
    if user_signed_in?
      @candidate = Candidate.where(user_id: current_user.id).first
      @candidature = Candidature.where(candidate_id: @candidate.id).first
      @proposal = Proposal.new(proposal_params)
      @proposal.candidature_id = @candidature.id
      if @proposal.save
      redirect_to '/proposals'
      flash[:success] = "Proposta cadastrada com sucesso!"
      else
        flash[:error] = @proposal.errors.full_messages_for(@proposal.errors.first.first)
      end
    else
      redirect_to '/users/sign_in'
      flash[:alert] = 'Favor efetuar login'
    end
  end

  def show
    @proposal = Proposal.find(params[:id])
  end

  def edit
    @proposal = Proposal.find(params[:id])
  end

  def update
    @proposal = Proposal.find(params[:id])
    @proposal.save
  end

  def destroy
    @proposal = Proposal.find(params[:id])
    @proposal.destroy
  end

  def upvote
    @proposal = Proposal.find(params[:id])
    @proposal.upvote_by current_user
    redirect_to proposals_path
  end

  def downvote
    @proposal = Proposal.find(params[:id])
    @proposal.downvote_from current_user
    redirect_to proposals_path
  end

  private

  def proposal_params
    params.require(:proposal).permit(:title, :description, :candidatura_id)
  end
end

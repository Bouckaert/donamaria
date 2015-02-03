class ProposalsController < ApplicationController
  def index
    if params[:search].present?
      @proposals = Proposal.search(params[:search]).page(params[:page]).per(10)
    else
      @proposals = Proposal.all.page(params[:page]).per(10)
    end

  end

  def new
    @proposal = Proposal.new
  end

  def create
    if user_signed_in?
      @representative = Representative.where(user_id: current_user.id).first
      @proposal = Proposal.new(proposal_params)
      @proposal.representative_id = @representative.id
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
    if user_signed_in?
      @proposal = Proposal.find(params[:id])
      @proposal.upvote_by current_user
      redirect_to proposals_path
    else
      redirect_to '/users/sign_in'
      flash[:alert] = 'Favor efetuar login'
    end
  end

  def downvote
    if user_signed_in?
      @proposal = Proposal.find(params[:id])
      @proposal.downvote_from current_user
      redirect_to proposals_path
    else
      redirect_to '/users/sign_in'
      flash[:alert] = 'Favor efetuar login'
    end
  end

  private

  def proposal_params
    params.require(:proposal).permit(:title, :description, :representative_id)
  end
end

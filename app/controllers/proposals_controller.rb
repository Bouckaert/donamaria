class ProposalsController < ApplicationController
  def index
    @proposals = Proposal.all
  end

  def new
    @proposal = Proposal.new
  end

  def create
    if user_signed_in?
      @candidato = Candidato.where(user_id: current_user.id)
      @candidatura = @candidato.candidatura.first
      @proposal = Proposal.new(proposal_params)
      if @proposal.save
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

  private

  def proposal_params
    params.require(:proposal).permit(:description, :candidatura_id)
  end
end

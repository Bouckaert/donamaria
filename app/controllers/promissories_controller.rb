class PromissoriesController < ApplicationController

  def new
    if current_user.address.zip_code.blank? || current_user.phone.blank?
      redirect_to edit_user_path(current_user)
      flash[:error] = "É necessario completar os dados do seu perfil antes de realizar uma doação"
    else
      @promissory = Promissory.new
      @promissory.user = current_user
      @proposal = Proposal.find(params[:proposal_id])
      @promissory.proposal = @proposal
      @representative = @proposal.representative
    end
  end

  def preview
    @current_month = Date.today + 1.month
    @current_month = @current_month.strftime("%B")
    @current_year = Time.now.year
    @promissory = Promissory.new(promissory_params)
    @promissory.user = current_user
    @proposal = Proposal.find(params[:proposal_id])
    @promissory.proposal = @proposal
    @representative = Representative.find(@proposal.representative_id)
    if @promissory.valid?
      flash[:success] = "Confirme os dados da promissória"
    else
      flash[:error] = @promissory.errors.full_messages_for(@promissory.errors.first.first)
      render :new
    end
  end

  def create
    if user_signed_in?
      @promissory = Promissory.new(promissory_params)
      @promissory.user = current_user
      @proposal = Proposal.find(params[:proposal_id])
      @promissory.proposal = @proposal
      @representative = @proposal.representative_id
      if @promissory.save
        flash[:success] = "Promissória cadastrada com sucesso!"
      else
        flash[:error] = @promissory.errors.full_messages_for(@promissory.errors.first.first)
      end
      redirect_to @promissory.user
    else
      redirect_to '/users/sign_in'
      flash[:alert] = 'Favor efetuar login'
    end
  end

  private

  def promissory_params
    params.require(:promissory)
      .permit(:installment, :amount, :expiration_day, :proposal_id, :user_id)
  end
end

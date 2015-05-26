class PromissoriesController < ApplicationController

  def new
    @promissory = Promissory.new
    @promissory.user = current_user
    @proposal = Proposal.find(params[:proposal_id])
    @promissory.proposal = @proposal
    @representative = @proposal.representative
  end

  def create
    if params[:commit] == "Avançar"
      @current_month = Date.today + 1.month
      @current_month = @current_month.strftime("%B")
      @current_year = Time.now.year
      @promissory = Promissory.new(promissory_params)
      @promissory.user = current_user
      @proposal = Proposal.find(params[:proposal_id])
      @promissory.proposal = @proposal
      @representative = Representative.find(@proposal.representative_id)
      if @promissory.valid?
        render :preview
        flash[:success] = "Confirme os dados da promissória"
      else
        redirect_to @promissory.user
        flash[:error] = @promissory.errors.full_messages_for(@promissory.errors.first.first)
      end
    else
      if user_signed_in?
        @promissory = Promissory.new(promissory_params)
        @promissory.user = current_user
        @proposal = Proposal.find(params[:proposal_id])
        @promissory.proposal = @proposal
        @representative = @proposal.representative_id
        if @promissory.save
          flash[:success] = "Promissoria cadastrada com sucesso!"
        else
          flash[:error] = @promissory.errors.full_messages_for(@promissory.errors.first.first)
        end
        redirect_to @promissory.user
      else
        redirect_to '/users/sign_in'
        flash[:alert] = 'Favor efetuar login'
      end
    end

  end

  private

    def promissory_params
      params.require(:promissory).permit(:installment, :amount, :expiration_day, :proposal_id, :user_id)
    end

end

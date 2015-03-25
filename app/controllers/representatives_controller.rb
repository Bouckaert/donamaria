class RepresentativesController < ApplicationController
  before_action :set_representative, only: [:show, :edit, :update, :destroy]
  before_action :set_type

  def index
   if params[:search]
      @representatives = type_class.search(params[:search]).page(params[:page]).per(10)
    else
      @representatives = type_class.all.with_gender("FEMININO").page(params[:page]).per(10)
    end
  end

  def show
    @representative = type_class.find(params[:id]).decorate
    if user_signed_in?
      render 'profile' if current_user.id == @representative.user_id
    else
      render 'show'
    end
    @proposals = @representative.proposals
  end

  def create
    @representative = Representative.new(ambassador_params)
    @representative.type = 'Ambassador'
    if @representative.save
      redirect_to @representative
      flash[:success] = "Embaixadora cadastrada com sucesso!"
    else
      flash[:error] = @representative.errors.full_messages_for(@representative.errors.first.first)
    end
  end


  private

  def set_type
    @type = type
  end

  def type
    Representative.types.include?(params[:type]) ? params[:type] : "Representative"
  end

  def type_class
    type.constantize
  end

  def set_representative
    @representative = type_class.find(params[:id])
  end

  def ambassador_params
    params.require(:representative).permit(:name, :occupation, :gender, :voter_registration, :web_page, :social_network, :phone_number, :presentation)
  end

end

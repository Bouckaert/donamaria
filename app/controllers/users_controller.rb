class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]).decorate
    @moot = Comment.where(:user_id => @user.id).map(&:proposal_id).uniq
    @support = Proposal.where(id: @user.votes.up.map(&:votable_id))
    @against = Proposal.where(id: @user.votes.down.map(&:votable_id))
    representatives_id=Proposal.where(id: @user.votes.up.map(&:votable_id)).map(&:representative_id).uniq
    unrepresentatives_id=Proposal.where(id: @user.votes.down.map(&:votable_id)).map(&:representative_id).uniq

    @representatives = Representative.where(id: representatives_id).uniq
    @unrepresentatives = Representative.where(id: unrepresentatives_id).uniq

    @recipients = Representative.where(id: @user.recipient)

    if params[:recent]
      @proposals = Proposal.all.recent
    elsif params[:pop]
      @proposals = Proposal.all.pop
    else
      @proposals = Proposal.where(id: @moot)
    end
  end

  def edit
    @user = User.find(params[:id])
    @user.build_address if @user.address.nil?
    if current_user == @user
      render 'edit'
    else
      redirect_to user_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Perfil atualizado"
      redirect_to @user
    else
      flash[:error] = @user.errors.full_messages
      redirect_to edit_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :cpf, :phone, address_attributes: [:id, :street, :complement, :district, :city, :state, :zip_code ])
  end
end

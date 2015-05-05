class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]).decorate
    @moot = Comment.where(:user_id => @user.id).map(&:proposal_id).uniq
    @support = Proposal.where(id: @user.votes.up.map(&:votable_id)).map(&:title)
    @against = Proposal.where(id: @user.votes.down.map(&:votable_id)).map(&:title)
    @representatives=Proposal.where(id: @user.votes.up.map(&:votable_id)).map(&:representative_id).uniq
    @unrepresentatives=Proposal.where(id: @user.votes.down.map(&:votable_id)).map(&:representative_id).uniq

    if params[:recent]
      @proposals = Proposal.all.recent
    elsif params[:pop]
      @proposals = Proposal.all.pop
    else
      @proposals = Proposal.where(id: @moot)
    end
  end
end

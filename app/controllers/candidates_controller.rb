class CandidatesController < ApplicationController
  def index
    if params[:search]
      @candidates = Candidate.search(params[:search]).page(params[:page]).per(10)
    else
      @candidates = Candidate.all.with_gender("FEMININO").page(params[:page]).per(10)
    end
  end

  def show
    @candidate = Candidate.find(params[:id])
    @proposals = @candidate.candidatures.first.proposals
  end

  def import
    Candidate.import
    redirect_to candidates_path
  end

    def candidate_params
      params.require(:candidate).permit(:name, :occupation, :gender, :voter_registration)
    end
end

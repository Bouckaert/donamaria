class CandidatesController < ApplicationController
  def index
    @candidates = Candidate.page(params[:page]).per(10)

    if params[:search].present?
      @candidates = Candidate.with_name(params[:search]).page(params[:page]).per(10)
    end
    if params[:gender].present?
      @candidates = Candidate.with_gender(params[:gender]).page(params[:page]).per(10)
    end

  end

  def import
    Candidate.import
    redirect_to candidates_path
  end

    def candidate_params
      params.require(:candidate).permit(:name, :occupation, :gender, :voter_registration)
    end
end

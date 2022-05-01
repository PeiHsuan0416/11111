class CandidatesController < ApplicationController

    def index
        @candidates = Candidate.all
    end

    def show
        @candidate = Candidate.find_by(id: params[:id])
    end

    def new
        @candidate = Candidate.new
    end

    def create
        @candidate = Candidate.new(candidate_params)
        if @candidate.save
            redirect_to "/candidates", notice: "新增成功"
        else
            render :new
        end
    end

    def edit
        @candidate = Candidate.find_by(id: params[:id])
    end

    def update
        @candidate = Candidate.find_by(id: params[:id])
        if @candidate.update(clean_params)
            redirect_to "/candidates", notice: "更新成功"
        else
            render :edit
        end
    end

    def destroy
        @candidate = Candidate.find_by(id: params[:id])
        @candidate.destroy
        redirect_to "/candidates", notice: "刪除成功"
    end


    private
        def find_candidate

        end

        def clean_params
            params.require(:candidate).permit(:name, :party, :age, :politics)
        end
end

class CandidatesController < ApplicationController

    def index
    end

    def new
        @candidate = Candidate.new
    end

    def create
        @candidate = Candidate.new
        if @candidate.save
            redirect_to "/candidates", notice: "新增成功"
        else
            render :new
        end
    end
end

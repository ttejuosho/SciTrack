class ParticipantController < ApplicationController
    before_action :participant, only: [:show, :edit, :update, :destroy]
    
    def index
        @participants = Participant.all
        respond_to do |format|
            format.html { render :participant  }
          end
    end
#get all participants for a coordinator
    def show
        @participants = Participant.find(params[:coordinator])
    end
#Create a new participant form
    def new
        @participant = Participant.new
        respond_to do |format|
            format.html { render :participant_new  }
        end
    end
#Edit participant information
    def edit
        @participant = Participant.find params[:id]
    end
#Save participant in DB
    def create
        @participant = Participant.new(participant_params)
        respond_to do |format|
            if @participant.save
              format.html { redirect_to @participant, notice: 'Participant was successfully created.' }
              format.json { render :show, status: :created, location: participant }
            else
              format.html { render :new }
              format.json { render json: @participant.errors, status: :unprocessable_entity }
            end
          end
    end

end
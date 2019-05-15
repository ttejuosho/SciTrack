class ParticipantController < ApplicationController
    
    def index
        @participants = Participant.all
        respond_to do |format|
            format.html { render :participant  }
          end
    end
#get all participants for a coordinator
    def show
        @participant = Participant.find(params[:id])
        respond_to do |format|
            format.html { render :participant_view  }
        end
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
        @participant = Participant.find(params[:id])
        respond_to do |format|
            format.html { render :participant_edit  }
          end
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

    #Update registry information
    def update
        @participant = Participant.find(params[:id])
        if @participant.update(participant_params)
            redirect_to participant_view_path
        else
            render :participant_edit
        end
    end

    #delete registry
    def destroy
        @participant = Participant.find(params[:id])
        @participant.destroy
        redirect_to participant_path
    end

    private
    def participant_params
      params.permit(:name, :email, :gender, :date_of_birth, :phone_number, :method_of_contact, :remarks, :Coordinator)
    end
end
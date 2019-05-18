class ParticipantController < ApplicationController
 #get all participants   
    def index
        @participants = Participant.all
        respond_to do |format|
            format.html { render :participant  }
          end
    end
#get 1 participant
    def show
        @participant = Participant.find(params[:id])
        respond_to do |format|
            format.html { render :participant_view  }
        end
    end

# #get all participants for a coordinator
def show_participants
    @participant = Participant.find(params[:id])
    respond_to do |format|
        format.html { render :participant  }
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

    #Update participant information
    def update
        @participant = Participant.find(params[:id])
        if @participant.update(participant_params)
            redirect_to participant_path
        else
            render :participant_edit
        end
    end

    #delete participant
    def destroy
        @participant = Participant.find(params[:id])
        @participant.destroy
        redirect_to participant_index_path
    end

    def participant_param
        params.require(:participant).permit(:name, :email, :gender, :date_of_birth, :phone_number, :method_of_contact, :remarks, :coordinator_id)
    end

    private
    def participant_params
      params.permit(:name, :email, :gender, :date_of_birth, :phone_number, :method_of_contact, :remarks, :coordinator_id)
    end
end
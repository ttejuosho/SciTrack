class CoordinatorController < ApplicationController
#before_action :coordinator, only: [:show, :edit, :update, :destroy]
#get all coordinators
    def index
        @coordinators = Coordinator.all
        respond_to do |format|
            format.html { render :coordinator  }
        end
    end

#get One coordinator
    def show
        @coordinator = Coordinator.find(params[:id])
        respond_to do |format|
            format.html { render :coordinator_view  }
        end
    end
    
#get all coordinators for a coordinator
    def show_coordinators
        @coordinator = Coordinator.find(params[:id])
        respond_to do |format|
            format.html { render :coordinator  }
        end
    end

#Change Coordinator information
    def edit
        @coordinator = Coordinator.find(params[:id])
        respond_to do |format|
            format.html { render :coordinator_edit  }
          end
    end

#New coordinator form
    def new
        @coordinator = Coordinator.new
        respond_to do |format|
            format.html { render :coordinator_new  }
        end
    end

#Save new Coordinator to DB
    def create
        @coordinator = Coordinator.new(coordinator_params)
        respond_to do |format|
            if @coordinator.save
              format.html { redirect_to @coordinator, notice: 'Coordinator was successfully created.' }
              format.json { render :show, status: :created, location: coordinator }
            else
              format.html { render :new }
              format.json { render json: @coordinator.errors, status: :unprocessable_entity }
            end
          end
    end

#Update Coordinator information
    def update
        @coordinator = Coordinator.find(params[:id])
        if @coordinator.update(coordinator_params)
            redirect_to coordinator_path
        else
            render :coordinator_edit
        end
    end

#delete Coordinator
    def destroy
        @coordinator = Coordinator.find(params[:id])
        @coordinator.destroy
        redirect_to coordinator_index_path
    end

    def coordinator_param
        params.require(:coordinator).permit(:name, :email, :phone_number, :coordinator_id)
    end

    private
    def coordinator_params
        params.permit(:name, :email, :phone_number, :coordinator_id)
    end
end
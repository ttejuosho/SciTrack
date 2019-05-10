class CoordinatorController < ApplicationController
    before_action :coordinator, only: [:show, :edit, :update, :destroy]
#get all coordinators
def index
    @coordinators = Coordinator.all
    respond_to do |format|
        format.html { render :coordinator  }
      end
end

    def show
        @coordinators = Coordinator.all
        render json: @coordinators
    end

#get coordinators for a registry
    def show
        @coordinators = Coordinator.find(params[:coordinator])
    end
#Change Coordinator information
    def edit
        @coordinator = Coordinator.find params[:id]
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
end
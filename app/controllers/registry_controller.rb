class RegistryController < ApplicationController
#Get all registries
    def index
        @registries = Registry.all
    end
#Get a registry
    def show
        @registry = Registry.find(params[:id])
        respond_to do |format|
            format.html { render :registry_view  }
        end
    end
#New registry form
    def new
        @registry = Registry.new
        respond_to do |format|
            format.html { render :registry_new  }
        end
    end
#Save new registry to DB
    def create
        @registry = Registry.new(registry_params)
        respond_to do |format|
            if @registry.save
              format.html { redirect_to @registry, notice: 'Registry was successfully created.' }
              format.json { render :show, status: :created, location: registry }
            else
              format.html { render :new }
              format.json { render json: @registry.errors, status: :unprocessable_entity }
            end
        end
    end
#Edit registry
    def edit
        @registry = Registry.find(params[:id])
        respond_to do |format|
            format.html { render :registry_edit  }
        end
    end
#Update registry information
    def update
        @registry = Registry.find(params[:id])
        if @registry.update(registry_params)
            redirect_to registry_path
        else
            render :registry_edit
        end
    end
#delete registry
    def destroy
        @registry = Registry.find(params[:id])
        @registry.destroy
        redirect_to registry_index_path
    end
    
  private
    def registry_params
      params.permit(:name, :location, :state)
    end
end

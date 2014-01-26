class MaintenancesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_maintenance, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /maintenances
  # GET /maintenances.json
  def index
    @car = Car.find(params[:car_id])
    @maintenances = @car.maintenances.all

    respond_to do |format|
       format.html # index.erb.html
    end
  end

  # GET /maintenances/1
  # GET /maintenances/1.json
  def show
     respond_to do |format|
       format.html # show.erb.html
     end
  end

  # GET /maintenances/new
  def new
    @car = Car.find(params[:car_id])
    @maintenance = @car.maintenances.new
  end

  # GET /maintenances/1/edit
  def edit
  end

  # POST /maintenances
  # POST /maintenances.json
  def create
    @car = Car.find(params[:car_id])
    @maintenance = @car.maintenances.new(maintenance_params)
    @maintenance.user_id = current_user.id

    respond_to do |format|
      if @maintenance.save
        format.html { redirect_to [@maintenance.car, @maintenance], notice: 'Maintenance was successfully created.' }
        format.json { render action: 'show', status: :created, location: @maintenance }
      else
        format.html { render action: 'new' }
        format.json { render json: @maintenance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenances/1
  # PATCH/PUT /maintenances/1.json
  def update
    respond_to do |format|
      if @maintenance.update(maintenance_params)
        format.html { redirect_to [@maintenance.car, @maintenance], notice: 'Maintenance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @maintenance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenances/1
  # DELETE /maintenances/1.json
  def destroy
    @maintenance.destroy
    respond_to do |format|
      format.html { redirect_to car_maintenances_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance
      @car = Car.find(params[:car_id])
      @maintenance = @car.maintenances.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def maintenance_params
      params.require(:maintenance).permit(:title, :date, :description, :cost, :user_id)
    end
end

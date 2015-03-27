class RefuelsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_refuel, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /refuels
  # GET /refuels.json
  def index
    @car = Car.accessible_by(current_ability).find(params[:car_id])
    @refuels = @car.refuels.all
  end

  def graphs
      @car = Car.accessible_by(current_ability).find(params[:car_id])
      @refuels = @car.refuels
      @mileageArray = Array.new
      @fuelCostArray = Array.new
      @mileageCostArray = Array.new
      @refuels.each do |refuel|
          @tmpMilage = (refuel.miles / refuel.gallons).round(2)
          @tmpFuelCost = (refuel.price / refuel.gallons).round(2)
          @tmpMileageCost = (refuel.price / refuel.miles).round(2)
          @tmpId = (refuel.id)
          ary = [@tmpId, @tmpMilage]
          ary2 = [@tmpId, @tmpFuelCost]
          ary3 = [@tmpId, @tmpMileageCost]
          @mileageArray.push(ary)
          @fuelCostArray.push(ary2)
          @mileageCostArray.push(ary3)
      end
  end

  # GET /refuels/1
  # GET /refuels/1.json
  def show
    respond_to do |format|
      format.html # show.erb.html
    end
  end

  # GET /refuels/new
  def new
    @car = Car.accessible_by(current_ability).find(params[:car_id])
    @refuel = @car.refuels.new
  end

  # GET /refuels/1/edit
  def edit
  end

  # POST /refuels
  # POST /refuels.json
  def create
    @car = Car.accessible_by(current_ability).find(params[:car_id])
    @refuel = @car.refuels.new(refuel_params)
    @refuel.user_id = current_user.id

    respond_to do |format|
      if @refuel.save
        format.html { redirect_to [@refuel.car, @refuel], notice: 'Refuel was successfully created.' }
        format.json { render action: 'show', status: :created, location: [@refuel.car, @refuel] }
      else
        format.html { render action: 'new' }
        format.json { render json: @refuel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /refuels/1
  # PATCH/PUT /refuels/1.json
  def update
    respond_to do |format|
      if @refuel.update(refuel_params)
        format.html { redirect_to [@refuel.car, @refuel], notice: 'Refuel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @refuel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /refuels/1
  # DELETE /refuels/1.json
  def destroy
    @refuel.destroy
    respond_to do |format|
      format.html { redirect_to car_refuels_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_refuel
      @car = Car.accessible_by(current_ability).find(params[:car_id])
      @refuel = @car.refuels.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def refuel_params
      params.require(:refuel).permit(:miles, :gallons, :price, :car_id, :user_id)
    end
end

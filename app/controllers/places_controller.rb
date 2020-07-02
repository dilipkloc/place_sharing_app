# frozen_string_literal: true

class PlacesController < ApplicationController
  before_action :set_place, only: %i[show edit update destroy]

  before_action :authenticate_user!

  # GET /places
  # GET /places.json
  def index
    @places = Place.where(user_id: current_user.id)
    # get the shared places with the logged in users
    # current_user.places
  end

  # GET /places/1
  # GET /places/1.json
  def show; end

  # GET /places/new
  def new
    @place = Place.new
  end

  # GET /places/1/edit
  def edit; end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(place_params)
    @place.user_id = current_user.id

    respond_to do |format|
      if @place.save
        if params['user_ids']
          unless params['user_ids'].empty?
            params['user_ids'].each do |id|
              Group.create(user_id: id, place_id: @place.id)
            end
          end
        end
        format.html { redirect_to @place, notice: 'Place was successfully created.' }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_place
    @place = Place.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def place_params
    params.require(:place).permit(:x_axis, :y_axis, :user_id, :share_id)
  end
end

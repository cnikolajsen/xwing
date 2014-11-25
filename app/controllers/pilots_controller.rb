class PilotsController < ApplicationController
  before_action :set_pilot, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @pilots = Pilot.all
    respond_with(@pilots)
  end

  def show
    respond_with(@pilot)
  end

  def new
    @pilot = Pilot.new
    respond_with(@pilot)
  end

  def edit
  end

  def create
    @pilot = Pilot.new(pilot_params)
    @pilot.save
    respond_with(@pilot)
  end

  def update
    @pilot.update(pilot_params)
    respond_with(@pilot)
  end

  def destroy
    @pilot.destroy
    respond_with(@pilot)
  end

  private
    def set_pilot
      @pilot = Pilot.friendly.find(params[:id])
    end

    def pilot_params
      params.require(:pilot).permit(:name, :skill, :description, :card_text, :slug)
    end
end

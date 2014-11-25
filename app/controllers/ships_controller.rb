class ShipsController < ApplicationController
  before_action :set_ship, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @ships = Ship.all
    respond_with(@ships)
  end

  def show
    respond_with(@ship)
  end

  def new
    @ship = Ship.new
    respond_with(@ship)
  end

  def edit
  end

  def create
    @ship = Ship.new(ship_params)
    @ship.save
    respond_with(@ship)
  end

  def update
    @ship.update(ship_params)
    respond_with(@ship)
  end

  def destroy
    @ship.destroy
    respond_with(@ship)
  end

  private
    def set_ship
      @ship = Ship.friendly.find(params[:id])
    end

    def ship_params
      params.require(:ship).permit(:ship_type, :primary_weapon, :agility, :hull, :shield, :description, :slug)
    end
end

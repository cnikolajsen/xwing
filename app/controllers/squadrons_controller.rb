class SquadronsController < ApplicationController
  include ShipsHelper
  before_action :set_squadron, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @squadrons = Squadron.where(:user_id => current_user.id)
    respond_with(@squadrons)
  end

  def show
    @faction_ships = Ship.where(:faction_id => @squadron.faction_id)

    @available_ships = []
    ship_types.each do |type|
      type_ships = Array.new
      Ship.where(:ship => type, :faction_id => @squadron.faction_id).each do |ship|
        type_ships << ship
      end
      @available_ships << {
        :type => type,
        :ships => type_ships
      }
    end
    #@faction_ships.each do |ship|
    #  @available_ships[:ship] = ship.ship
    #end
    #@duties.merge!('Universal' => Duty.where('career_id IS NULL').order(:name).map { |duty| [duty.id, duty.name, duty.description] })

    #Career.where(:true).each do |career|
    #  @duties.merge!(career.name => Duty.where('career_id = ?', career.id).order(:name).map { |duty| [duty.id, duty.name, duty.description] })
    #end

    respond_with(@squadron)
  end

  def new
    @squadron = Squadron.new
    respond_with(@squadron)
  end

  def edit
  end

  def create
    @squadron = Squadron.new(squadron_params)
    @squadron.user_id = current_user.id
    @squadron.wins = 0
    @squadron.draws = 0
    @squadron.losses = 0
    @squadron.save
    respond_with(current_user, @squadron)
  end

  def update
    @squadron.update(squadron_params)
    respond_with(current_user, @squadron)
  end

  def destroy
    @squadron.destroy
    respond_with(current_user, @squadron)
  end

  private
    def set_squadron
      @squadron = Squadron.find(params[:id])
    end

    def squadron_params
      params.require(:squadron).permit(:name, :description, :points, :wins, :draws, :losses, :faction_id, :user_id, :slug)
    end
end

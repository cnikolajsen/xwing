class SquadronsController < ApplicationController
  before_action :set_squadron, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @squadrons = Squadron.where(:user_id => current_user.id)
    respond_with(@squadrons)
  end

  def show
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

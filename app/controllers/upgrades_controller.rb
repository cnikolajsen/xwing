class UpgradesController < ApplicationController
  before_action :set_upgrade, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @upgrades = Upgrade.all
    respond_with(@upgrades)
  end

  def show
    respond_with(@upgrade)
  end

  def new
    @upgrade = Upgrade.new
    respond_with(@upgrade)
  end

  def edit
  end

  def create
    @upgrade = Upgrade.new(upgrade_params)
    @upgrade.save
    respond_with(@upgrade)
  end

  def update
    @upgrade.update(upgrade_params)
    respond_with(@upgrade)
  end

  def destroy
    @upgrade.destroy
    respond_with(@upgrade)
  end

  private
    def set_upgrade
      @upgrade = Upgrade.friendly.find(params[:id])
    end

    def upgrade_params
      params.require(:upgrade).permit(:name, :ability, :attack_value, :weapon_range, :category, :cost, :image_url, :slug)
    end
end

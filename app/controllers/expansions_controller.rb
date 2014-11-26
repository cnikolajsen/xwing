class ExpansionsController < ApplicationController
  before_action :set_expansion, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @expansions = Expansion.all
    respond_with(@expansions)
  end

  def show
    respond_with(@expansion)
  end

  def new
    @expansion = Expansion.new
    respond_with(@expansion)
  end

  def edit
  end

  def create
    @expansion = Expansion.new(expansion_params)
    @expansion.save
    respond_with(@expansion)
  end

  def update
    @expansion.update(expansion_params)
    respond_with(@expansion)
  end

  def destroy
    @expansion.destroy
    respond_with(@expansion)
  end

  private
    def set_expansion
      @expansion = Expansion.friendly.find(params[:id])
    end

    def expansion_params
      params.require(:expansion).permit(:title, :description, :slug)
    end
end

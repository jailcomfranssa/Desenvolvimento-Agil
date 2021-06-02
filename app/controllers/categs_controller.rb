class CategsController < ApplicationController
  before_action :authorized
  before_action :set_categ, only: [:show, :update, :destroy]

  # GET /categs
  def index
    @categs = Categ.all

    render json: @categs
  end

  # GET /categs/1
  def show
    render json: @categ
  end

  # POST /categs
  def create
    @categ = Categ.new(categ_params)

    if @categ.save
      render json: @categ, status: :created, location: @categ
    else
      render json: @categ.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categs/1
  def update
    if @categ.update(categ_params)
      render json: @categ
    else
      render json: @categ.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categs/1
  def destroy
    @categ.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categ
      @categ = Categ.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def categ_params
      params.require(:categ).permit(:nome)
    end
end

class EnderecosController < ApplicationController
  before_action :authorized
  before_action :set_endereco, only: [:show, :update, :destroy]

  # GET /enderecos
  def index
    @enderecos = Endereco.all

    render json: @enderecos, each_serializer: EnderecosSerializer
                             
  end

  # GET /enderecos/1
  def show
    render json: @endereco, serializer: EnderecosSerializer
  end

  # POST /enderecos
  def create
    @endereco = Endereco.new(endereco_params)

    if @endereco.save
      render json: @endereco, status: :created, location: @endereco
    else
      render json: @endereco.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /enderecos/1
  def update
    if @endereco.update(endereco_params)
      render json: @endereco
    else
      render json: @endereco.errors, status: :unprocessable_entity
    end
  end

  # DELETE /enderecos/1
  def destroy
    @endereco.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_endereco
      @endereco = Endereco.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def endereco_params
      params.require(:endereco).permit(:rua, :numero, :complemento, :cidade, :estado, :bairro, :user_id)
    end
end

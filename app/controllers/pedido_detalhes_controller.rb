class PedidoDetalhesController < ApplicationController
  before_action :authorized
  before_action :set_pedido_detalhe, only: [:show, :update, :destroy]

  # GET /pedido_detalhes
  def index
    @pedido_detalhes = PedidoDetalhe.all
    
    render json: @pedido_detalhes, each_serializer: PedidoDetalhesSerializer
  end

  # GET /pedido_detalhes/1
  def show
    render json: @pedido_detalhe, serializer: PedidoDetalhesSerializer
  end

  # POST /pedido_detalhes
  def create
    @pedido_detalhe = PedidoDetalhe.new(pedido_detalhe_params)

    if @pedido_detalhe.save
      render json: @pedido_detalhe, status: :created, location: @pedido_detalhe
    else
      render json: @pedido_detalhe.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pedido_detalhes/1
  def update
    if @pedido_detalhe.update(pedido_detalhe_params)
      render json: @pedido_detalhe
    else
      render json: @pedido_detalhe.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pedido_detalhes/1
  def destroy
    @pedido_detalhe.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido_detalhe
      @pedido_detalhe = PedidoDetalhe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pedido_detalhe_params
      params.require(:pedido_detalhe).permit(:quantidade, :pedido_id, :produto_id)
    end
end

require "test_helper"

class PedidoDetalhesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pedido_detalhe = pedido_detalhes(:one)
  end

  test "should get index" do
    get pedido_detalhes_url, as: :json
    assert_response :success
  end

  test "should create pedido_detalhe" do
    assert_difference('PedidoDetalhe.count') do
      post pedido_detalhes_url, params: { pedido_detalhe: { pedido_id: @pedido_detalhe.pedido_id, produto_id: @pedido_detalhe.produto_id, quantidade: @pedido_detalhe.quantidade } }, as: :json
    end

    assert_response 201
  end

  test "should show pedido_detalhe" do
    get pedido_detalhe_url(@pedido_detalhe), as: :json
    assert_response :success
  end

  test "should update pedido_detalhe" do
    patch pedido_detalhe_url(@pedido_detalhe), params: { pedido_detalhe: { pedido_id: @pedido_detalhe.pedido_id, produto_id: @pedido_detalhe.produto_id, quantidade: @pedido_detalhe.quantidade } }, as: :json
    assert_response 200
  end

  test "should destroy pedido_detalhe" do
    assert_difference('PedidoDetalhe.count', -1) do
      delete pedido_detalhe_url(@pedido_detalhe), as: :json
    end

    assert_response 204
  end
end

require File.expand_path '../../test_helper', __dir__

# Test class for Delete Virtual Network Gateway Request
class TestDeleteVirtualNetworkGateway < Minitest::Test
  def setup
    @service = Fog::Network::AzureRM.new(credentials)
    client = @service.instance_variable_get(:@network_client)
    @network_gateways = client.virtual_network_gateways
    @promise = Concurrent::Promise.execute do
    end
  end

  def test_delete_network_interface_success
    response = ApiStub::Requests::Network::VirtualNetworkGateway.delete_virtual_network_gateway_response
    @promise.stub :value!, response do
      @network_gateways.stub :delete, @promise do
        assert @service.delete_virtual_network_gateway('fog-test-rg', 'fog-test-network-gateway'), response
      end
    end
  end

  def test_delete_network_interface_failure
    response = -> { raise MsRestAzure::AzureOperationError.new(nil, nil, 'error' => { 'message' => 'mocked exception' }) }
    @promise.stub :value!, response do
      @network_gateways.stub :delete, @promise do
        assert_raises(RuntimeError) { @service.delete_virtual_network_gateway('fog-test-rg', 'fog-test-network-gateway') }
      end
    end
  end
end

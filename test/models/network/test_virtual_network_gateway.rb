require File.expand_path '../../test_helper', __dir__

# Test class for VirtualNetworkGateway Model
class TestVirtualNetworkGateway < Minitest::Test
  def setup
    @service = Fog::Network::AzureRM.new(credentials)
    @network_gateway = virtual_network_gateway(@service)
  end

  def test_model_methods
    response = ApiStub::Models::Network::VirtualNetworkGateway.create_virtual_network_gateway_response
    methods = [
      :save,
      :destroy
    ]
    @service.stub :create_or_update_virtual_network_gateway, response do
      methods.each do |method|
        assert @network_gateway.respond_to? method
      end
    end
  end

  def test_model_attributes
    response = ApiStub::Models::Network::VirtualNetworkGateway.create_virtual_network_gateway_response
    attributes = [
      :name,
      :id,
      :location,
      :resource_group,
      :tags,
      :gateway_type,
      :gateway_size,
      :vpn_type,
      :enable_bgp,
      :provisioning_state,
      :sku_name,
      :sku_tier,
      :sku_capacity,
      :vpn_client_address_pool,
      :gateway_default_site,
      :default_sites,
      :ip_configurations,
      :vpn_client_configuration,
      :asn,
      :bgp_peering_address,
      :peer_weight
    ]
    @service.stub :create_or_update_virtual_network_gateway, response do
      attributes.each do |attribute|
        assert @network_gateway.respond_to? attribute
      end
    end
  end

  def test_save_method_response
    response = ApiStub::Models::Network::VirtualNetworkGateway.create_virtual_network_gateway_response
    @service.stub :create_or_update_virtual_network_gateway, response do
      assert_instance_of Fog::Network::AzureRM::VirtualNetworkGateway, @network_gateway.save
    end
  end

  def test_destroy_method_response
    @service.stub :delete_virtual_network_gateway, true do
      assert @network_gateway.destroy
    end
  end
end

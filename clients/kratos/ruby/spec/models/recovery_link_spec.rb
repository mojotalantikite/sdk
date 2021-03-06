=begin
#Ory Kratos

#Welcome to the ORY Kratos HTTP API documentation!

The version of the OpenAPI document: v0.5.0-alpha.1

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.3.1

=end

require 'spec_helper'
require 'json'
require 'date'

# Unit tests for OryHydraClient::RecoveryLink
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'RecoveryLink' do
  before do
    # run before each test
    @instance = OryHydraClient::RecoveryLink.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of RecoveryLink' do
    it 'should create an instance of RecoveryLink' do
      expect(@instance).to be_instance_of(OryHydraClient::RecoveryLink)
    end
  end
  describe 'test attribute "expires_at"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "recovery_link"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end

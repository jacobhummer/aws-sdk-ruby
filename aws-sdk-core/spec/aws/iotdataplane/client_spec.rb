require 'spec_helper'
require 'stringio'

module Aws
  module IoTDataPlane
    describe Client do

      it 'requires a region for signing purposes' do
        expect {
          Client.new
        }.to raise_error(Aws::Errors::MissingRegionError)
      end

      it 'requires an endpoint' do
        expect {
          Client.new(region:'us-west-1')
        }.to raise_error(ArgumentError, "missing required option `:endpoint'")
      end

      it 'requires a valid endpoint' do
        expect {
          Client.new(region:'us-west-1', endpoint:'foo')
        }.to raise_error(ArgumentError, "expected :endpoint to be a HTTP or HTTPS endpoint")
      end


      it 'can be constructed with a region and endpoint' do
        expect {
          Client.new(region:'us-west-1', endpoint:'https://foo.com')
        }.not_to raise_error
      end

    end
  end
end

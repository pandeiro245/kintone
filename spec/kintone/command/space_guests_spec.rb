require 'spec_helper'
require 'kintone/command/space_guests'
require 'kintone/api'

describe Kintone::Command::SpaceGuests do
  let(:target) { Kintone::Command::SpaceGuests.new(guest) }
  let(:guest) { api.guest(guest_id) }
  let(:guest_id) { 1 }
  let(:api) { Kintone::Api.new('example.cybozu.com', 'Administrator', 'cybozu') }

  describe '#update' do
    before(:each) do
      stub_request(
        :put,
        'https://example.cybozu.com/k/guest/1/v1/space/guests.json'
      )
        .with(body: { id: id, guests: guests }.to_json)
        .to_return(body: '{}', status: 200)
    end

    subject { target.update(id, guests) }

    let(:id) { 10 }
    let(:guests) do
      [
        'guest1@example.com',
        'guest2@example.com',
        'guest3@example.com'
      ]
    end

    it { is_expected.to be_truthy }
  end
end

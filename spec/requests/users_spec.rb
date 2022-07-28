# frozen_string_literal: true

require 'rails_helper'
require 'vcr'

describe 'Github' do
  let(:user) { User.new(login: 'dhh') }

  it 'can fetch & parse user data' do
    expect(user.attributes).to be_kind_of(Hash)

    expect(user.attributes).to have_key('login')
    expect(user.attributes).to have_key('repos')
    expect(user.attributes).to have_key('full_name')
  end
end

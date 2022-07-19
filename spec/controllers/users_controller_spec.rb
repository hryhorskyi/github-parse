# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context 'GET /users/index' do
    it 'displays link to search' do
      get :index
    end
  end

  context 'GET /users/new' do
    before(:each) do
      get :new
    end

    it 'should return new user' do
      expect(assigns(:user)).to_not eq nil
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  context 'GET /users/create' do
    it 'should create new user' do
      expect do
        User.create({ login: 'dhh' })
      end.to change(User, :count).by(1)
    end
  end

  context 'GET /users/show' do
    let(:user) { User.create(login: 'dhh') }

    it 'should render show template' do
      expect(response).to render_template
    end
  end
end

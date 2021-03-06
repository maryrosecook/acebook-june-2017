require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  require "spec_helper"
  include Capybara::DSL
  describe "GET /show " do
    before do
      User.create(name: 'Tom', email: 'Tom@fakegmail.com', password: 'password123', password_confirmation: 'password123')
    end
    it "responds with 200" do
      get :show, params: { id: 1 }
      expect(response).to have_http_status(200)
    end
    it "adds user to database" do
      expect{ User.create(name: "test", email: "test@test.com", password: "Password123",
        password_confirmation: "Password123") }.to change{ User.count }.by(1)
    end
  end
end

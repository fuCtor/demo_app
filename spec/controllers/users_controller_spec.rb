require 'spec_helper'

RSpec.describe UsersController, type: :controller do
  describe "PUT #update" do
    let(:user) { create :user }
    it "returns http success" do
      put :update, id: user.id, name: :name, value: 'new_name', format: :js
      expect(response).to have_http_status(:success)
      user.reload
      expect(user.name).to eq('new_name')
    end
  end
end

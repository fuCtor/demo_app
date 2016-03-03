require 'spec_helper'

RSpec.describe CommitsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      expect(ImportService).to receive('run').with('user', 'repo').and_return([{}])
      post :create, {import: {user: 'user', repo: 'repo' }}
      expect(response).to have_http_status(302)
    end
  end

end

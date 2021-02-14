require 'rails_helper'

RSpec.describe RegionsController, type: :controller do
  
  context "unauthenticated users" do
    describe "#index" do
      it "redirects to the sign_in screen" do
        get :index
        expect(response).to  redirect_to(new_user_session_url)
      end 
    end

    describe "#show" do
      it "redirects to the sign_in screen" do
        get :show, params: {id: 'fake'}
        expect(response).to  redirect_to(new_user_session_url)
      end 
    end

    describe "#new" do
      it "redirects to the sign_in screen" do
        get :new
        expect(response).to  redirect_to(new_user_session_url)
      end 
    end

    describe "#create" do
      it "redirects to the sign_in screen" do
        post :create
        expect(response).to  redirect_to(new_user_session_url)
      end 
    end

    describe "#update" do
      it "redirects to the sign_in screen" do
        put :update, params: {id: 'fake'}
        expect(response).to  redirect_to(new_user_session_url)
      end 
    end

    describe "#destroy" do
      it "redirects to the sign_in screen" do
        delete :destroy, params: {id: 'fake'}
        expect(response).to  redirect_to(new_user_session_url)
      end 
    end
  end

  
  
end

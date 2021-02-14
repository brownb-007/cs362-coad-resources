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

  context "an organization user" do
    before do
      organization_user = build(:user, :mem_of_org)
      allow(request.env['warden']).to receive(:authenticate!).and_return(organization_user)
      allow(controller).to receive(:current_user).and_return(organization_user)
    end

    describe "dashboard redirection" do
      it "redirects user to the dashboard" do
        get :index
        expect(response).to  redirect_to(dashboard_url)
        get :show, params: {id: 'fake'}
        expect(response).to  redirect_to(dashboard_url)
        get :new
        expect(response).to  redirect_to(dashboard_url)
        post :create
        expect(response).to  redirect_to(dashboard_url)
        put :update, params: {id: 'fake'}
        expect(response).to  redirect_to(dashboard_url)
        delete :destroy, params: {id: 'fake'}
        expect(response).to  redirect_to(dashboard_url)
      end
    end
  end
  
  
end

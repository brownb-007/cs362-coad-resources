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
        get :show, params: { id: 'fake' }
        expect(response).to  redirect_to(new_user_session_url)
      end 
    end

    describe "#new" do
      it "redirects to the sign_in screen" do
        get :new
        expect(response).to  redirect_to(new_user_session_url)
      end 
    end

    describe "#edit" do
      it "redirects to the sign_in screen" do
        get :edit, params: { id: 'fake' } 
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
        put :update, params: { id: 'fake' }
        expect(response).to  redirect_to(new_user_session_url)
      end 
    end

    describe "#destroy" do
      it "redirects to the sign_in screen" do
        delete :destroy, params: { id: 'fake' }
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
        expect(response).to redirect_to(dashboard_url)
        get :show, params: {id: 'fake'}
        expect(response).to redirect_to(dashboard_url)
        get :new
        expect(response).to redirect_to(dashboard_url)
        get :edit, params: {id: 'fake'}
        expect(response).to redirect_to(dashboard_url)
        post :create
        expect(response).to redirect_to(dashboard_url)
        put :update, params: {id: 'fake'}
        expect(response).to redirect_to(dashboard_url)
        delete :destroy, params: {id: 'fake'}
        expect(response).to redirect_to(dashboard_url)
      end
    end
  end

  context "an admin user" do
    let(:region) { create(:region) }
    before do
      admin_user = create(:user, :admin)
      allow(request.env['warden']).to receive(:authenticate!).and_return(admin_user)
      allow(controller).to receive(:current_user).and_return(admin_user)
    end

    describe "#index" do
      it "gets the index" do
        get :index
        expect(response).to  be_successful
      end 
    end

    describe "#show" do
      it "gets show" do
        get :show, params: { id: region.id }
        expect(response).to  be_successful
      end 
    end

    describe "#new" do
      it "gets new" do
        get :new
        expect(response).to  be_successful
      end 
    end

    describe "#create" do
      it "posts a created region" do
        post :create, params: { region: attributes_for(:region) }
        expect(response).to  redirect_to(regions_path)
      end 
    end

    describe "#update" do
      it "puts an updated region" do
        put :update, params: { id: region.id, region: attributes_for(:region) }
        expect(response).to  redirect_to(region_path(region))
      end 
    end

    describe "#destroy" do
      it "deletes a region" do
        delete :destroy, params: { id: region.id }
        expect(response).to  redirect_to(regions_path)
      end 
    end
  end
end

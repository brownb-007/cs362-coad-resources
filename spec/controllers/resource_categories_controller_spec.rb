require 'rails_helper'

RSpec.describe ResourceCategoriesController, type: :controller do
  
  context "unauthenticated users" do
    describe "#index" do
      it "redirects to the sign_in screen" do
        get :index
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

    describe "#activate" do
      it "redirects to the sign_in screen" do
        patch :activate, params: {id: 'fake'}
        expect(response).to  redirect_to(new_user_session_url)
      end 
    end

    describe "#deactivate" do
      it "redirects to the sign_in screen" do
        patch :deactivate, params: {id: 'fake'}
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
        expect(response).to redirect_to(dashboard_url)
        get :new
        expect(response).to redirect_to(dashboard_url)
        post :create
        expect(response).to redirect_to(dashboard_url)
        put :update, params: {id: 'fake'}
        expect(response).to redirect_to(dashboard_url)
        patch :activate, params: {id: 'fake'}
        expect(response).to redirect_to(dashboard_url)
        patch :deactivate, params: {id: 'fake'}
        expect(response).to redirect_to(dashboard_url)
        delete :destroy, params: {id: 'fake'}
        expect(response).to redirect_to(dashboard_url)
      end
    end
  end

  context "an admin user" do
    let(:resource_category) { create(:resource_category) }
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
        get :show, params: { id: resource_category.id }
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
      it "posts a created resource_category" do
        post :create, params: { resource_category: attributes_for(:resource_category) }
        expect(response).to  redirect_to(resource_categories_path)
      end 
    end

    describe "#update" do
      it "puts an updated resource_category" do
        put :update, params: { id: resource_category.id, resource_category: attributes_for(:resource_category) }
        expect(response).to  redirect_to(resource_category_path(resource_category))
      end 
    end

    describe "#activate" do
      it "patches an activated resource_category" do
        patch :activate, params: { id: resource_category.id }
        expect(response).to  redirect_to(resource_category_path(resource_category))
      end 
    end

    describe "#deactivate" do
      it "puts an deactivated resource_category" do
        put :deactivate, params: { id: resource_category.id }
        expect(response).to  redirect_to(resource_category_path(resource_category))
      end 
    end

    describe "#destroy" do
      it "deletes a resource_category" do
        delete :destroy, params: { id: resource_category.id }
        expect(response).to  redirect_to(resource_categories_path)
      end 
    end
  end
end

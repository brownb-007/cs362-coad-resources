require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do
  
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
        put :update, params: { id: 'fake' }
        expect(response).to  redirect_to(new_user_session_url)
      end 
    end

    describe "#approve" do
      it "redirects to the sign_in screen" do
        post :approve, params: { id: 'fake' }
        expect(response).to  redirect_to(new_user_session_url)
      end 
    end

    describe "#reject" do
      it "redirects to the sign_in screen" do
        post :reject, params: { id: 'fake' }
        expect(response).to  redirect_to(new_user_session_url)
      end 
    end

  end

  context "an organization user" do
    let(:organization) { create(:organization) }
    before do
      organization_user = build(:user, :mem_of_org)
      allow(request.env['warden']).to receive(:authenticate!).and_return(organization_user)
      allow(controller).to receive(:current_user).and_return(organization_user)
    end

    describe "#index" do
      it "get index" do
        get :index
        expect(response).to  be_successful
      end 
    end

    describe "#new" do
      it "get new" do
        get :new
        expect(response).to  be_successful
      end 
    end

    describe "#create" do
      it "post create" do
        post :create, params:{ id: organization.id, organization: attributes_for(:organization) }
        expect(response).to  redirect_to(dashboard_url)
      end 
    end

    describe "#update" do
      it "put update" do
        put :update, params:{ id: organization.id, organization: attributes_for(:organization) }
        expect(response).to  redirect_to(dashboard_url)
      end 
    end

    describe "#approve" do
      it "post approve" do
        post :approve, params: { id: organization.id }
        expect(response).to  redirect_to(dashboard_url)
      end 
    end

    describe "#reject" do
      it "post reject" do
        post :reject, params: { id: organization.id }
        expect(response).to  redirect_to(dashboard_url)
      end 
    end
  end

  context "an admin user" do
    let(:organization) { create(:organization) } 
    before do
      admin_user = create(:user, :admin)
      allow(request.env['warden']).to receive(:authenticate!).and_return(admin_user)
      allow(controller).to receive(:current_user).and_return(admin_user)
    end

    describe "#index" do
      it "get index" do
        get :index
        expect(response).to  be_successful
      end 
    end

    describe "#new" do
      it "get new" do
        get :new
        expect(response).to  redirect_to(dashboard_url)
      end 
    end

    describe "#create" do
      it "post create" do
        post :create, params: { organization: attributes_for(:organization) }
        expect(response).to  redirect_to(dashboard_url)
      end 
    end

    describe "#update" do
      it "put update" do
        put :update, params:{ id: organization.id, organization: attributes_for(:organization) }
        expect(response).to  redirect_to(dashboard_url)
      end 
    end

    describe "#approve" do
      it "post approve" do
        post :approve, params: { id: organization.id }
        expect(response).to  redirect_to(organizations_path)
      end 
    end

    describe "#reject" do
      it "post reject" do
        post :reject, params: { id: organization.id, organization: {rejection_reason: 'fake'} }
        expect(response).to  redirect_to(organizations_path)
      end 
    end
  end
end

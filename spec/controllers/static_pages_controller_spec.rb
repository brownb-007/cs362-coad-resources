require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  context "unauthenticated users" do
    describe "#index" do
      it "gets the index of the dashboard" do
        get :index
        expect(response).to  be_successful
      end
    end
  end

  context "an organization user" do
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
  end

  context "an admin user" do
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
  end
end

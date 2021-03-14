require 'rails_helper'

RSpec.describe TicketsController, type: :controller do

  context "unauthorized user" do
    describe "#new" do
      it "adds a new ticket" do
        get :new
        expect(response).to be_successful
      end
    end
  end

  context "an organization user" do
    let(:ticket) { create(:ticket) }
    before do
      organization_user = build(:user, :mem_of_org)
      allow(request.env['warden']).to receive(:authenticate!).and_return(organization_user)
      allow(controller).to receive(:current_user).and_return(organization_user)
    end

    describe "#new" do
      it "adds a new ticket" do
        get :new
        expect(response).to be_successful
      end
    end

    describe "#release" do
      it "release the ticket" do
        post :release, params: { id: ticket.id }
        expect(response).to redirect_to(dashboard_path)
      end
    end

    describe "#close" do
      it "close the ticket" do
        patch :close, params: { id: ticket.id }
        expect(response).to redirect_to(dashboard_path)
      end
    end

    describe "#capture" do
      it "capture the ticket" do
        post :capture, params: { id: ticket.id }
        expect(response).to redirect_to(dashboard_path)
      end
    end
  end

  context "an admin user" do
    let(:ticket) { create(:ticket) }
    before do
      admin_user = create(:user, :admin)
      allow(request.env['warden']).to receive(:authenticate!).and_return(admin_user)
      allow(controller).to receive(:current_user).and_return(admin_user)
    end

    describe "#show" do
      it "gets show" do
        get :show, params: { id: ticket.id }
        expect(response).to be_successful
      end
    end
    

    describe "#new" do
      it "adds a new ticket" do
        get :new
        expect(response).to be_successful
      end
    end

    describe "#release" do
      it "release the ticket" do
        post :release, params: { id: ticket.id }
        expect(response).to redirect_to(dashboard_path)
      end
    end

    describe "#close" do
      it "close the ticket" do
        patch :close, params: { id: ticket.id }
        expect(response).to redirect_to(dashboard_path << "#tickets:open")
      end
    end

    describe "#capture" do
      it "capture the ticket" do
        post :capture, params: { id: ticket.id }
        expect(response).to redirect_to(dashboard_path)
      end
    end

    describe "#destroy" do
      it "deletes a ticket" do
        delete :destroy, params: { id: ticket.id }
        expect(response).to redirect_to(dashboard_path << "#tickets")
      end
    end   
  end
end

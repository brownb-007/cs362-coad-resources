require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the DashboardHelper. For example:
#
# describe DashboardHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe DashboardHelper, type: :helper do
  before do
    @user = double()
  end

  describe "#dashboard_for" do
    it "takes admin to admin dashboard" do
      allow(@user).to receive(:admin?) { true }
      expect(helper.dashboard_for(@user)).to eq("admin_dashboard") 
    end

    it "takes submitted organization to submitted dashboard" do
      allow(@user).to receive(:admin?) { false }
      allow(@user).to receive_message_chain(:organization, :submitted?) { true }
      expect(helper.dashboard_for(@user)).to eq("organization_submitted_dashboard")
    end
    
    it "takes approved organization to approved dashboard" do
      allow(@user).to receive(:admin?) { false }
      allow(@user).to receive_message_chain(:organization, :submitted?) { false }
      allow(@user).to receive_message_chain(:organization, :approved?) { true }
      expect(helper.dashboard_for(@user)).to eq("organization_approved_dashboard")
    end
    
    it "takes unauthorized user to the default dashboard" do
      allow(@user).to receive(:admin?) { false }
      allow(@user).to receive_message_chain(:organization, :submitted?) { false }
      allow(@user).to receive_message_chain(:organization, :approved?) { false }
      expect(helper.dashboard_for(@user)).to eq("create_application_dashboard") 
    end
  end
end
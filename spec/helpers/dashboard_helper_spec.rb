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
  describe "dashboard_for" do
    it "takes admin to admin dashboard" do
      expect(helper.dashboard_for(build(:user, :admin))).to eq("admin_dashboard") 
    end

    it "takes submitted organization to submitted dashboard" do
      org = build(:organization)
      expect(helper.dashboard_for(build(:user, organization: org))).to eq("organization_submitted_dashboard")
    end
    
    it "takes approved organization to approved dashboard" do
      approved_org = build(:organization, :approved)
      expect(helper.dashboard_for(build(:user, :mem_of_org, organization: approved_org))).to eq("organization_approved_dashboard")
    end
    
    it "takes unauthorized user to the default dashboard" do
      expect(helper.dashboard_for(build(:user))).to eq("create_application_dashboard") 
    end
  end
  
end

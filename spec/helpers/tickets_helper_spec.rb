require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the TIcketsHelper. For example:
#
# describe TIcketsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe TicketsHelper, type: :helper do
  describe "#format_phone_number" do
    it "Makes sure phone number is valid" do
      expect(helper.format_phone_number("222-222-2222")).to eq("+12222222222")
    end   
  end
end

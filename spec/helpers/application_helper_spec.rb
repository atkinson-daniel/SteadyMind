require "rails_helper"

RSpec.describe ApplicationHelper, :type => :helper do
  describe "#flash_class" do
    it "returns bootstrap class based on flash message type" do
      expect(helper.flash_class(:notice)).to eq("alert alert-info")
      expect(helper.flash_class(:success)).to eq("alert alert-success")
      expect(helper.flash_class(:error)).to eq("alert alert-error")
    end
  end
end

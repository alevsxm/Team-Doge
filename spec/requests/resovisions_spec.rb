require 'rails_helper'

RSpec.describe "Resovisions", :type => :request do
  describe "GET /resovisions" do
    it "works! (now write some real specs)" do
      get resovisions_path
      expect(response.status).to be(200)
    end
  end
end

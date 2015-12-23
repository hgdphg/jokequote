require 'rails_helper'

RSpec.describe "JokeContents", :type => :request do
  describe "GET /joke_contents" do
    it "works! (now write some real specs)" do
      get joke_contents_path
      expect(response).to have_http_status(200)
    end
  end
end

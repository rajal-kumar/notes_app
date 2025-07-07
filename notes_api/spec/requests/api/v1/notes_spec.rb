require 'rails_helper'

RSpec.describe "Api::V1::Notes", type: :request do
  describe "POST /notes" do
    it "creates a note with title and body" do
      post "/api/v1/notes", params: {
        note: { title: "Test note", body: "This is a **Markdown**" }
      }

      expect(response).to have_http_status(:created)
      json = JSON.parse(response.body)
      expect(json["title"]).to eq("Test note")
      expect(json["body"]).to eq("This is a **Markdown**")
    end
  end
end

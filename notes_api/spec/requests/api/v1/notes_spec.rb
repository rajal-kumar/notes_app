require 'rails_helper'

RSpec.describe "Api::V1::Notes", type: :request do
  describe "GET /api/v1/notes" do
    it "returns all notes" do
      note = Note.create!(title: "Test", body: "Body")

      get "/api/v1/notes"

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Test")
    end
  end

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

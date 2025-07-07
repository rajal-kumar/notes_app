require 'rails_helper'

RSpec.describe Note, type: :model do
  context "when posting a note" do
    it "is valid with a title and body" do
      note = Note.new(title: "Test", body: "Some context")
      expect(note).to be_valid
    end

    it "is invalid without a title" do
      note = Note.new(title: nil, body: "Some context")

      expect(note).to_not be_valid
      expect(note.errors[:title]).to include("can't be blank")
    end

    it "is invalid without a body" do
      note = Note.new(title: "Test", body: nil)

      expect(note).to_not be_valid
      expect(note.errors[:body]).to include("can't be blank")
    end
  end
end

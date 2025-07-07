module Api
  module V1
    class NotesController < ApplicationController
      def index
        render json: Note.all
      end

      def show
        note = Note.find(params[:id])

        render json: note
      end

      def create
        note = Note.new(note_params)

        if note.save
          render json: note, status: :created
        else
          render json: { errors: note.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def note_params
        params.require(:note).permit(:title, :body)
      end
    end
  end
end

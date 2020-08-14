class NotesController < ApplicationController
    # before_action :check_id_before_deleting only: [:destroy]
    def create
        @note = current_user.notes.new(note_params)
        if @note.save
            redirect_to track_url(@note.track_id)
        else
            flash.now[:errors] = @note.errors.full_messages
        end
    end

    def destroy
        @note = current_user.notes.find_by(id: params[:id])
        @note.destroy
        redirect_to track_url(@note.track_id)
    end

    private

    def note_params
        params.require(:note).permit(:note, :track_id, :user_id)
    end

end
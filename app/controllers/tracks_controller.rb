class TracksController < ApplicationController
    def new
        @track = Track.new(album_id: params[:album_id])
        render :new
    end

    def create
        @track = Track.new(track_params)
        if @track.save
            redirect_to track_path(@track)
        else
            flash.now[:errors] = @track.errors.full_messages
            render :new
        end
    end

    def show
        @track = Track.find_by(id: params[:id])
        render :show
    end

    def update
        @track = Track.find_by(id: params[:id])
        if @track.update_attributes(track_params)
            redirect_to track_path(@track)
        else
            flash.now[:errors] = @track.errors.full_messages
            render :edit
        end
    end

    def edit
        @track = Track.find_by(id: params[:id])
        render :edit
    end

    def destroy
        @track = Track.find_by(id: params[:id])
        @track.destroy
    end

    private

    def track_params
        params.require(:track).permit(:title, :lyrics, :ord, :bonus, :album_id)
    end

end
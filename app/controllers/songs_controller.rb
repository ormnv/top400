class SongsController < ApplicationController
	def new 
		# debugger
		# form_for_var = [@show, @show.songs.build]
        @song = Song.find(params[:song_id])
    end 

	def create
		# debugger
		# form_for_var = [@show, @show.songs.build]
    	@show = Show.find(params[:show_id])
    	@song = @show.songs.create(song_params)
    	redirect_to show_path(@show)
 	end

	def update
		debugger
		@song = Song.find(params[:id])
	 
		if @song.update(song_params)
			debugger
		    redirect_to @song.show
	  	else
	    	render 'edit'
	  	end
	end

	def show
		@song = Song.find(params[:id])
	end

	def edit
		@song = Song.find(params[:id])
		@show = @show.nil? ? @song.show : @show 
		@form_for_var = :song
		@method = "patch"
		@url = show_song_path(@show)
	end

	def destroy
	    @show = Show.find(params[:show_id])
    	@song = @show.songs.find(params[:id])
    	@song.destroy
    	redirect_to show_path(@show)
  	end
 
	private

		def song_params
			params.require(:song).permit(:artist, :title, :album, :bpm, :key)
		end
end

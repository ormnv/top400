class ShowsController < ApplicationController
	def index
		@shows = Show.all.not_standalone
		@tracklists = Show.all.standalone
	end

	def new
		authentication_required!
		# @user = SiteUser.all
		@show = Show.new
	end

	def create
		authentication_required!
		# @user = SiteUser.all
		Show.transaction do 
			@show = Show.create!(show_params)

		# if params[:djs]
		# 	params[:djs].each do |dj|
		# 		unless dj[:name].blank? 
		# 			@dj = Dj.where(name: dj[:name])
		# 			@dj = Dj.create(name: dj[:name]) if @dj.blank?
		# 			@show.djs.push(@dj)
		# 		end
		# 	end
		# end

		# uploaded_image = show_params[:image]
		# if uploaded_image
		# 	image_filename = sanitize_filename(uploaded_image.original_filename)
		# 	File.open(Rails.root.join('public', 'images', image_filename), 'wb') do |file|
		# 	  file.write(uploaded_image.read)
		# 	end
		# 	@show.image = image_filename
		# end

			uploaded_tracklist = show_params[:tracklist]
			if uploaded_tracklist 
				tracklist_filename = sanitize_filename(uploaded_tracklist.original_filename)
				File.open(Rails.root.join('public', 'tracklists', tracklist_filename), 'wb') do |file|
				  file.write(uploaded_tracklist.read)
				end
				tracklist_path = Rails.root + "public/tracklists/" + tracklist_filename
				CSV.foreach(tracklist_path, :headers => true) do |row|
					@show.process_song(row)
				end
			end
		end
		 
		if @show.save
		    redirect_to @show
	  	else
	    	render 'new'
	  	end
	end

	def update
		authentication_required!
		@user = SiteUser.all
		@show = Show.find(params[:id])
	 	
		if @show.update(show_params)
		    redirect_to @show
	  	else
	    	render 'edit'
	  	end
	end

	def show
	 	# debugger
		@show = Show.find(params[:id])
		authentication_required! if @show.is_standalone?
		@form_for_var = [@show, @show.songs.build]
	end

	def edit
		authentication_required!
		@user = SiteUser.all
		@show = Show.find(params[:id])
	end

	 def destroy
	 	authentication_required!
		@user = SiteUser.all
	    @show = Show.find(params[:id])
	    @show.destroy
	 
	    redirect_to shows_path
	end

	# def admin
	#  	authentication_required!
	#  	redirect_to shows_path if session[:current_user]
	#  	flash[:notice] = "Not Authorized to access this page, plese log in"
 #        redirect_to new_session_path
	# end

  # 	protected
		# def sanitize_filename(filename)
		# 	return filename.gsub!(/[^0-9A-Za-z.\-]/, '_')
		# end

	private
		def show_params
			params.require(:show).permit(:title, :date, :description, :tracklist, :link_to_soundcloud, :link_to_newtown_radio, :flyer, :is_standalone, djs_attributes: [:name])
		end
	
end

class MoviesController < ApplicationController
  def index
  	@movies =  Movie.all
  end
  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    #debugger
    render(:partial => 'movie2', :object => @movie) if request.xhr?
    # will render app/views/movies/show.<extension> by default
  end
	def new
		# default: render 'new'  template
	end
	def create
		@movie = Movie.new(params[:movie])
		if @movie.save
			flash[:notice]= "#{@movie.title} was succesfully created."
			redirect_to movies_path
		else
			render 'new' # 'new'  template can access @movie field values
		end
	end
	def edit
		@movie = Movie.find params[:id]
	end
	def update
		@movie = Movie.find params[:id]
		if @movie.update_attributes(params[:movie])
			flash[:notice] = "#{@movie.title} succesfully updated."
			redirect_to movies_path
		else
			render 'edit' # 'edit' template can access @movie field values
		end
	end
	def destroy
		@movie =  Movie.find(params[:id])
		@movie.destroy
		flash[:notice] = "Movie '#{@movie.title}' deleted."
		redirect_to movies_path
	end
end



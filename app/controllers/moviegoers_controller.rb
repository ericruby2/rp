class MoviegoersController < ApplicationController
  def index
  	@moviegoers =  Moviegoer.all
  end
	def show
	  id = params[:id] # retrieve moviegoer ID from URI route
	  @moviegoer = Moviegoer.find(id) # look up moviegoer by unique ID
	  # will render app/views/moviegoers/show.html.haml by default
	end
	def new
		# default: render 'new'  template
	end
	def create
		@moviegoer = Moviegoer.new(params[:moviegoer])
		if @moviegoer.save
			flash[:notice]= "#{@moviegoer.name} was succesfully created."
			redirect_to moviegoers_path
		else
			render 'new' # 'new'  template can access @moviegoer field values
		end
	end
	def edit
		@moviegoer = Moviegoer.find params[:id]
	end
	def update
		@moviegoer = Moviegoer.find params[:id]
		if @moviegoer.update_attributes(params[:moviegoer])
			flash[:notice] = "#{@moviegoer.name} succesfully updated."
			redirect_to moviegoers_path
		else
			render 'edit' # 'edit' template can access @moviegoer field values
		end
	end
	def destroy
		@moviegoer =  Moviegoer.find(params[:id])
		@moviegoer.destroy
		flash[:notice] = "Moviegoer '#{@moviegoer.name}' deleted."
		redirect_to moviegoers_path
	end
end



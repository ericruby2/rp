class ReviewsController < ApplicationController
  before_filter :has_moviegoer_and_movie, :only => [:new, :create]
  protected
  def has_moviegoer_and_movie
    unless current_user
      flash[:warning] = 'You must be logged in to create a review.'
      redirect_to login_path
    end
    unless (@movie = Movie.find_by_id(params[:movie_id]))
      flash[:warning] = 'Review must be for an existing movie.'
      redirect_to movies_path
    end
  end
  public
  def new
    @review = @movie.reviews.build
 #   debugger
    
  end
  def create
    # since moviegoer_id is a protected attribute that won't get
    # assigned by the mass-assignment from params[:review], we set it
    # by using the << method on the association.  We could also
    # set it manually with review.moviegoer = @current_user.
    current_user.reviews << @movie.reviews.build(params[:review])
    current_user.can!(:edit, @review)
    redirect_to movie_path(@movie)
  end
  def edit
#  debugger
		@review = Review.find params[:id]
		
  end
  def update
    
    @review = Review.find params[:id]
#    debugger
   if !(current_user.can?(:edit, @review))
      flash[:notice] = "Review #{@review.id} for #{@review.movie.title} can only be updated by #{@review.moviegoer.name}."      
      render 'edit' # 'edit' template can access @movie field values
    elsif @review.update_attributes(params[:review])
      flash[:notice] = "Review #{@review.id} for #{@review.movie.title} from #{@review.moviegoer.name} succesfully updated."
      redirect_to movies_path
    else
      render 'edit' # 'edit' template can access @movie field values
    end
  end
  def destroy
 #   debugger
    @review =  Review.find(params[:id])
    @review.destroy
    flash[:notice] = "Review for '#{@review.movie.title}' from '#{@review.moviegoer.name}' deleted."
    redirect_to movie_path(@review.movie)
  end  
end

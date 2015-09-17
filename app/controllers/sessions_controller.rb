class SessionsController < ApplicationController
	def create  
#    debugger
    auth = request.env["omniauth.auth"]  

    user = Moviegoer.find_by_provider_and_uid(auth["provider"], auth["uid"]) ||  
      Moviegoer.create_with_omniauth(auth)
    session[:user_id] = user.id  
    redirect_to root_url, :notice => "Signed in!"    
  end
  def destroy  
  	session.delete(:user_id)
    flash[:notice] = "logged out succesfully" 
    redirect_to movies_path
  end   
end

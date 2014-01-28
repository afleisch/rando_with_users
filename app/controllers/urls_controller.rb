class UrlsController < ApplicationController

 def index 
   @urls = Url.all
   render :index
 end

 def new
   @url = Url.new
 end

 def create
   @random_string = SecureRandom.urlsafe_base64(7)
   new_url= params.require(:url).permit(:link)

	 if params[:url][:link].include?("http://")
	   url = Url.create(new_url) do |u|
       u.random_string = @random_string
       end
       
       redirect_to "/urls/#{url.id}"
	 
	 else
	   render :error    
     end

 end

 def show
   id = params[:id]
   @url = Url.find(id)
   @random_string = @url.random_string
   render :show
 end

 def redirect
   random_string = params[:random_string]
   url = Url.find_by random_string: random_string
   redirect_to url.link, status: 301
 end

 def preview
   id = params[:id]
   url = Url.find(id)
   @random_string = url.random_string
   @random_url = url.link
   render :preview
 end

 def delete
   id = params[:id]
   @url = Url.find(id)
   @link = @url[:link]
   @url.destroy
   render :delete
 end
end
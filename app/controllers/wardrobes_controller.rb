class WardrobesController < ApplicationController

  # GET: /wardrobes
  get "/wardrobes" do
    if logged_in?
      @wardrobes = Wardrobe.all
      erb :"/wardrobes/index"
    else
      redirect to "/login"
    end
 end
  # GET: /wardrobes/new
  get "/wardrobes/new" do
    if logged_in?
      erb :"wardrobes/new"
    else
      redirect to "/login"
    end
  end

  # POST: /wardrobes
  post "/wardrobes" do
    if params[:item] == ""
    redirect "/wardrobes/new"
    else
     @wardrobe = current.user.wardrobe.create(item: params[:item])
     redirect to "wardrobes/#{@wardrobe.id}"
    end
   end

  # GET: /wardrobes/5
  get "/wardrobes/:id" do
    erb :"/wardrobes/show.html"
  end

  # GET: /wardrobes/5/edit
  get "/wardrobes/:id/edit" do
    erb :"/wardrobes/edit.html"
  end

  # PATCH: /wardrobes/5
  patch "/wardrobes/:id" do
    redirect "/wardrobes/:id"
  end

  # DELETE: /wardrobes/5/delete
  delete "/wardrobes/:id/delete" do
    redirect "/wardrobes"
  end
end

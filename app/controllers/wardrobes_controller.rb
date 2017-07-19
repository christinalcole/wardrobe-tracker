class WardrobesController < ApplicationController

  # GET: /wardrobes
  get '/wardrobes' do
    if logged_in?
      @wardrobes = Wardrobe.all
      erb :'wardrobes/index'
    else
      redirect to '/login'
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
     @wardrobe = current_user.wardrobes.create(item: params[:item])
     redirect to "wardrobes/#{@wardrobe.id}"
    end
   end

  # GET: /wardrobes/5
  get "/wardrobes/:id" do
    if logged_in?
      @wardrobe = Wardrobe.find_by_id(params[:id])
    erb :"/wardrobes/show"
    else
      redirect to "/login"
    end
  end


#   # GET: /wardrobes/5/edit
  get "/wardrobes/:id/edit" do
    if logged_in?
      @wardrobe = Wardrobe.find_by_id(params[:id])
     if @wardrobe.user_id == current_user.id
      erb :"/wardrobes/edit"
      else
      redirect to "/wardrobes"
    end
  else redirect to "/login"
    end
  end

#   # PATCH: /wardrobes/5
  patch "/wardrobes/:id" do
    if params[:item] == ""
    redirect "/wardrobes/#{params[:id]}/edit"
    else
      @wardrobe = Wardrobe.find_by_id(params[:id])
      @wardrobe.item = params[:item]
      @wardrobe.description = params[:description]
      @wardrobe.save
      redirect "/wardrobes/#{@wardrobe.id}"
    end
  end
#
#   # DELETE: /wardrobes/5/delete
  delete "/wardrobes/:id/delete" do
    if logged_in?
      @wardrobe = Wardrobe.find_by_id(params[:id])
      if @wardrobe.user_id == current_user.id
         @wardrobe.delete
       redirect "/wardrobes"
      else
       redirect "/wardrobes"
      end
     else
       redirect "/login"
    end
  end
end

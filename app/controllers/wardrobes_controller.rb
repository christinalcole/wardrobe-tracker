class WardrobesController < ApplicationController

  get "/wardrobes" do
    if logged_in?
      @wardrobes = current_user.wardrobes
      erb :"wardrobes/index"
    else
      redirect to "/login"
    end
  end

  get "/wardrobes/new" do
    if logged_in?
      erb :"wardrobes/new"
    else
      redirect to "/login"
    end
  end

  post "/wardrobes" do
    if params[:item] == "" || params[:description] == ""
      flash[:message] = "You need to complete all the required fields."
    redirect "/wardrobes/new"
    else
     @wardrobe = current_user.wardrobes.create(params)
     redirect to "wardrobes/#{@wardrobe.id}"
    end
   end

  get "/wardrobes/:id" do
    if logged_in?
      @wardrobe = Wardrobe.find_by_id(params[:id])
      erb :"/wardrobes/show"
    else
      redirect to "/login"
    end
  end

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

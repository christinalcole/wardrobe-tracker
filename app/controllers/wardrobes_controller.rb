class WardrobesController < ApplicationController

  # GET: /wardrobes
  get "/wardrobes" do
    erb :"/wardrobes/index.html"
  end

  # GET: /wardrobes/new
  get "/wardrobes/new" do
    erb :"/wardrobes/new.html"
  end

  # POST: /wardrobes
  post "/wardrobes" do
    redirect "/wardrobes"
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

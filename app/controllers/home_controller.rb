class HomeController < ApplicationController
  def show
    authorize :"#{params[:controller]}", :show?
  end
end
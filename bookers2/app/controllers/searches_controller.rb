class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
  	@model = params[:search][:model]
    @how = params[:search][:how]
    @value = params[:search][:value]

    if @model == "user"
      @users = User.search(@value, @model, @how)
    else
      @books = Book.search(@value, @model, @how)
    end
  end

end

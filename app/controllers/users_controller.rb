class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
  	id = params[:id]
  	@user=User.find(id)
  end

  def create
  	@user=User.new(params[:user])
    if @user.save
      flash[:notice] = "Welcome to Rando!"
      #sign_in @user
      redirect_to @user
    else
      render'new'
    end
  end
end

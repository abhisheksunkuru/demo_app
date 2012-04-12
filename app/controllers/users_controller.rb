class UsersController < ApplicationController
  
  before_filter :load_user, :except => [:index,:new,:create]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end
  
   def edit
   end
  
  def update
   if @user.update_attributes(params[:user])
    redirect_to @user
   else
    render 'edit'
  end
  end

  def destroy
    @user.destroy
    redirect_to :action=>'index'
  end

  private

  def load_user
    @user = User.find(params[:id])
  end

end

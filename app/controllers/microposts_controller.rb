class MicropostsController < ApplicationController
  before_filter :load_post, :except => [:index,:new,:create]
  before_filter :load_user, :only => [:new, :edit]

  def index
    @posts = Micropost.all
  end

  def show
     
  end

  def new
    @post = @user.microposts.build
  end

  def create
    @post = Micropost.new(params[:micropost])
    if @post.save
      redirect_to microposts_path
    else
      render 'new'
    end   
  end

  def edit   
  end

  def update
    if @post.update_attributes(params[:micropost])
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to :action=>'index'
  end

  private

  def load_post
    @post = Micropost.find(params[:id])
  end  

  def load_user
     @user = User.find(params[:user_id])
   end
end

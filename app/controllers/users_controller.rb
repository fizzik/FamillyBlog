class UsersController < ApplicationController

  before_filter :authenticate, :only => [:edit, :update]
  before_filter :authenticate, :only => [:edit, :update]
  before_filter :authenticate, :only => [:index, :edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy


  def index
    @total_users = User.count
    @users = User.search(params[:search])
    @users = User.paginate(:page => params[:page], :per_page => 15)
  end

  def show
    @total_users = User.count
    @user = User.find(params[:id])
    @title = @user.name
  end

  def new
    @total_users = User.count
    @user = User.new
    @title = "Sign up"

  end

  def create
    @total_users = User.count
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to my blog!"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end

  def edit
    @total_users = User.count
    @user = User.find(params[:id])
    @title = "Edit user"

  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end

  def update
    @user = User.find(params[:id])
      respond_to do |format|
        if @user.update_attributes(params[:user])
          format.html { redirect_to :notice => 'User was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @user.errors, :status => :unprocessable_entity }
        end
      end
  end

  private

  def authenticate
    deny_access unless signed_in?
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(user_path) unless current_user?(@user)
  end

  def admin_user
    redirect_to(index_path) unless current_user.admin?
  end
  def correct_user_ban
    redirect_to(root_path) unless current_user?(@user)
  end


end

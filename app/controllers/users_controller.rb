class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @bookings = @user.booking
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      respond_to do |format|
        format.html { redirect_to user_path(@user) }
        format.js
      end
      flash[:notice] = "L'utilisateur #{@user.first_name} a bien été créé"
    else
      respond_to do |format|
        format.html { render 'user/show' }
        format.js
      end
    end
  end

  def edit
  end

  def update
    @user.update(user_params)
    if @user.save
      respond_to do |format|
        format.html { redirect_to user_path(@user) }
        format.js
      end
      flash[:notice] = "L'utilisateur #{@user.first_name} a bien été mis à jour"
    else
      respond_to do |format|
        format.html { render 'user/show' }
        format.js
      end
    end
  end

  def destroy
    if @user.booking.empty?
      @user.destroy
      redirect_to users_path
      flash[:alert] = "L'utilisateur #{@user.first_name} a bien été supprimé"
    else
      flash[:alert] = "L'utilisateur #{@user.first_name} possède des livres non rendus"
      redirect_to user_path(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :image, :image_cache)
  end

  def set_user
    @user = User.find(params[:id])
  end
end

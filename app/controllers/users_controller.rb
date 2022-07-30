class UsersController < ApplicationController
    def new
        @user = User.new
        @user.save
    end

  def show
   @user = User.find(params[:id])
   @books = @user.books
   @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else 
      redirect_to user_path(current_user)
        
    end
  end

  def update
    @user = User.find(params[:id])

     if @user.update(users_params)
     redirect_to user_path(@user.id),notice: 'successfully'

     else
     render :edit
     end
  end

  def index
   @users = User.all
   @user = current_user
   @book = Book.new
  end

private

  def users_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def correct_user
  @user = User.find(params[:id])
  redirect_to(user_path(current_user)) unless @user == current_user
  end
end

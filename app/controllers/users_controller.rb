class UsersController < ApplicationController
 before_action :correct_user, only: [:edit, :update]
 def index
  @book = Book.new
  @user = current_user
  @users= User.all
 end
 
 def show
  @user = User.find(params[:id])
  @books = @user.books
  @book = Book.new
 end
 
 def update
  @user = User.find(params[:id])
  if @user.update(user_params)
   flash[:notice]= 'You have updated user successfully.'
   redirect_to user_path(@user.id)
  else
   render :edit
  end
 end
 
 def create
     user = User.new(user_params)
     user.user_id = current_user.id
   if  user.save
     flash[:notice]= "Welcome! You have signed up successfully."
     redirect_to user_path(user.id)
   end
 end
 
 def edit
  @user = User.find(params[:id])
 end
 
 private

  def user_params
    params.require(:user).permit(:profile_image,:name,:introduction,:title,:body,:email)
  end
  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless @user == current_user
  end

end

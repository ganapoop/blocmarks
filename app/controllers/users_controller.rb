class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @bookmarks = @user.bookmarks
    @liked_bookmarks = @user.liked_bookmarks
  end
end

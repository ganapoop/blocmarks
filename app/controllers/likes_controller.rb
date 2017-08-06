class LikesController < ApplicationController
  def index
  end

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    if like.save
      flash[:notice] = "Your like has been saved!"
      redirect_to topic_path(bookmark.topic_id)
    else
      flash[:alert] = "There was an error saving your like. Please try again."
      redirect_to topic_path(bookmark.topic_id)
    end
  end

  def destroy
    bookmark = Bookmark.find(params[:bookmark_id])
    like = Like.find(params[:id])

    if like.destroy
      flash[:notice] = "Bookmark unliked."
      redirect_to topic_path(bookmark.topic_id)
    else
      flash[:alert] = "Unliking failed."
      redirect_to topic_path(bookmark.topic_id)
    end
  end
end

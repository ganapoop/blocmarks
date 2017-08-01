class BookmarksController < ApplicationController
  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def create
    authorize @bookmark
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.create(bookmark_params)



    if @bookmark.save
      flash[:notice] = "Bookmark saved!"
      redirect_to topics_path
    else
      flash[:alert] = "Something went wrong. Please try again."
      render :new
    end
  end

  def show
    authorize @bookmark
    @bookmark = Bookmark.find(params[:id])

  end

  def edit
    @bookmark = Bookmark.find(params[:id])

  end

  def update
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    @bookmark.assign_attributes(bookmark_params)

    if @bookmark.save
      flash[:notice] = "Bookmark successfully  updated!"
      redirect_to bookmark_path(@bookmark)
    else
      flash[:alert] = "Bookmark NOT updated. Please try again."
      render :edit
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    if @bookmark.destroy
      flash[:notice] = "Bookmark was successfully deleted!"
      redirect_to topic_path(@bookmark.topic)
    else
      flash[:alert] = "Bookmark was NOT deleted. Please try again."
      render :show
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end

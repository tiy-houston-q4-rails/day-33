class AlbumsController < ApplicationController

  before_action :authenticate_user!, except: :index

  before_action do
    @tags = ActsAsTaggableOn::Tag.most_used
  end

  def index
    @albums = Album.tally
    @albums = @albums.search(params[:search]) if params[:search].present?
  end

  def tagged
    @albums = Album.tally.tagged_with(params[:tag_name])
    render :index
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(params.require(:album).permit(:name, :photo, :tag_list))
    if @album.save
      redirect_to root_path
    else
      render :new
    end
  end

  def vote
    @album = Album.find(params[:id])
    up_or_down = params[:yay_or_nay]
    if up_or_down == "up"
      current_user.vote_exclusively_for(@album)
    else
      current_user.vote_exclusively_against(@album)
    end
    redirect_to root_path
  end
end

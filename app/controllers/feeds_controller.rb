class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :edit, :update, :destroy]
  before_action :user_login_check, only: [:new]

  def index
    @feeds = Feed.all
  end

  def show
    @favorite = current_user.favorites.find_by(feed_id: @feed.id)
  end

  def new
      @feed = current_user.feeds.build
   end

   def edit
       if @feed.user != current_user
         flash.now[:error] = 'unauthorized access!'
         redirect_to feeds_path
       else
     end
   end

   def create
   @feed= current_user.feeds.build(feed_params)
   if params[:back]
     render :new
   else
   if @feed.save
     FeedMailer.feed_mail(@feed).deliver
     redirect_to feeds_path, notice: 'Feed was posted'
   else
     render :new
   end
 end
end

  def confirm
    @feed = current_user.feeds.build(feed_params)
    render :new if @feed.invalid?
  end
  # PATCH/PUT /feeds/1
  # PATCH/PUT /feeds/1.json
  def update
    respond_to do |format|
      if @feed.update(feed_params)
        format.html { redirect_to @feed, notice: 'Feed was updated' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @feed.destroy
      redirect_to feeds_url, notice: 'Feed was deleted'
    end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_feed
    @feed = Feed.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def feed_params
    params.require(:feed).permit(:image, :content, :image_cache, :user_id)
  end

  def user_login_check
  unless logged_in?
    redirect_to root_path
   end
 end
end

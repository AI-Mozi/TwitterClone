class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_tweet, only: [:create, :show, :edit, :update, :destroy]

  def create
    @comment = @tweet.comments.create(comment_params)
    redirect_to tweet_path(@tweet)
  end

  def destroy
    @comment = @tweet.comments.find(params[:id])
    @comment.destroy
    redirect_to tweet_path(@tweet)
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end

  def comment_params
    params.require(:comment).permit(:name, :body, :username, :email)
  end
end

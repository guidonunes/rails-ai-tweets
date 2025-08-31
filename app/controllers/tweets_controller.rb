class TweetsController < ApplicationController


  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)

    chat = RubyLLM.chat(model: "gemini-2.5-pro")
    response = chat.ask("Generate a tweet with less than 280 characters based on this text: #{@tweet.long}")

    @tweet.shortened = response.content

    if @tweet.save
      redirect_to tweet_path(@tweet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:long)
  end


end

class PagesController < ApplicationController
  before_action :set_kitten_url, only: [:kitten, :kittens]

  def welcome
    @header = "This is the welcome page"
  end

  def about
    @header = "About this site"
  end

  def contest
    flash[:notice] = "Sorry, the contest has ended. You didn't win."
    redirect_to "/"
  end

  def kitten
  end

  def kittens
  end

  def secrets
    if params[:magic_word] != "test"
      flash[:alert] = "Sorry wrong passcode"
      redirect_to '/'
    end
  end

  def set_kitten_url
    requested_size = params[:size]
    @kitten_url = "http://lorempixel.com/#{requested_size}/#{requested_size}/cats"
  end
end

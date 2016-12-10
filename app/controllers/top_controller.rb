class TopController < ApplicationController
  def home
    @events = Event.all
  end
end

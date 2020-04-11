class PagesController < ApplicationController
  def home
  end

  def all_users
    @events = Event.where(start: params[:start]..params[:end])
  end
end

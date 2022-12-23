class StaticPagesController < ApplicationController
  require 'flickr.rb'

  def index 
    flickr = Flickr.new('74ad1960737d1f7e008295f5c4e3e8fd')
    unless params[:user_id].blank?
      user = flickr.users(params[:user_id])
      @photos = user.photos
      @photos = @photos.map { |photo| [photo.title, "https://live.staticflickr.com/#{photo.server}/#{photo.id}_#{photo["secret"]}.jpg"] }
    end
  end
end

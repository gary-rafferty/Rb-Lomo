require "rb-lomo/version"
require "rb-lomo/camera"
require "rb-lomo/photo"
require "rb-lomo/film"
require "rb-lomo/user"

require 'rest_client'
require 'json'
require 'pp'

module Rb
  module Lomo

    API_BASE = 'http://api.lomography.com/v1'

    class Client

      def initialize api_key
        @api_key = api_key
      end

      def photos_from url
        resp = RestClient.get("#{API_BASE}/#{url}", params: { api_key: @api_key})
        json = JSON.parse resp

        retval = []
        json['photos'].each {|p| retval << Photo.new(p)}

        retval
      end

      def cameras_from url
        resp = RestClient.get("#{API_BASE}/#{url}", params: { api_key: @api_key})
        json = JSON.parse resp

        retval = []
        json['cameras'].each {|c| retval << Camera.new(c)}

        retval
      end

      def films_from url
        resp = RestClient.get("#{API_BASE}/#{url}", params: { api_key: @api_key})
        json = JSON.parse resp

        retval = []
        json['films'].each {|f| retval << Film.new(f)}

        retval
      end

      def popular_photos
        photos_from '/photos/popular'
      end

      def recent_photos
        photos_from '/photos/recent'
      end

      def selected_photos
        photos_from 'photos/selected'
      end

      def cameras
        cameras_from '/cameras'
      end

      def camera id
        cameras_from "/cameras/#{id}"
      end

      def popular_camera_photos id
        photos_from "/cameras/#{id}/photos/popular"
      end

      def recent_camera_photos id
        photos_from "/cameras/#{id}/photos/recent"
      end

      def films
        films_from '/films'
      end

      def popular_film_photos id
        photos_from "/films/#{id}/photos/popular"
      end

      def recent_film_photos id
        photos_from "/films/#{id}/photos/recent"
      end
    end
  end
end

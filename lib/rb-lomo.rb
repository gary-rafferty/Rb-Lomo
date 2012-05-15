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

      def popular_photos
        data_from '/photos/popular'
      end

      def recent_photos
        data_from '/photos/recent'
      end

      def selected_photos
        data_from 'photos/selected'
      end

      def cameras
        data_from '/cameras', 'cameras'
      end

      def camera id
        data_from "/cameras/#{id}", 'cameras'
      end

      def popular_camera_photos id
        data_from "/cameras/#{id}/photos/popular"
      end

      def recent_camera_photos id
        data_from "/cameras/#{id}/photos/recent"
      end

      def films
        data_from '/films', 'films'
      end

      def popular_film_photos id
        data_from "/films/#{id}/photos/popular"
      end

      def recent_film_photos id
        data_from "/films/#{id}/photos/recent"
      end

      private

      def data_from url, type='photos'
        resp = RestClient.get("#{API_BASE}/#{url}", params: { api_key: @api_key})
        json = JSON.parse resp

        retval = []
        case type
        when 'photos'
          json['photos'].each {|p| retval << Photo.new(p)}
        when 'cameras'
          json['cameras'].each {|c| retval << Camera.new(c)}
        when 'films'
          json['films'].each {|f| retval << Film.new(f)}
        end

        retval
      end
    end
  end
end

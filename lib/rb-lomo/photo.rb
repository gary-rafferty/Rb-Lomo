module Rb
  module Lomo
    class Photo
      ##
      # The ID attribute of the Photo
      attr_reader :id

      ##
      # The title attribute of the Photo
      attr_reader :title

      ##
      # The description attribute of the Photo
      attr_reader :description

      ##
      # The URL attribute of the Photo
      attr_reader :url

      ##
      # The camera attributes of the Photo
      # @return Camera object
      attr_reader :camera

      ##
      # The film attribute of the Photo
      # @return Film object
      attr_reader :film

      ##
      # The user attribute of the Photo
      # @return User object
      attr_reader :user

      ##
      # Expects a JSON object
      def initialize json
        @json       = json
        @id         = @json['id']
        @title      = @json['title']
        @description= @json['description']
        @url        = @json['url']
        @user       = User.new @json['user']

        if @json['camera']
          @camera     = Camera.new @json['camera']
        end

        if @json['film']
          @film       = Film.new @json['film']
        end

        if @json['longitude'] && @json['latitude']
          @longitude  = @json['location']['longitude']
          @latitude   = @json['location']['latitude']
        end
      end

      def location

        if @longitude && @latitude
          {
            longitude: @longitude,
            latitude: @latitude
          }
        else
          'Location unknown'
        end
      end

      def small_asset_url
        @json['assets']['small']['url']
      end

      def large_asset_url
        @json['assets']['large']['url']
      end

      def size
        {
          small: { 
            width: @json['assets']['small']['width'],
            height: @json['assets']['small']['height']
          },
          large: { 
            width: @json['assets']['large']['width'],
            height: @json['assets']['large']['height']
          }
        }
      end
    end
  end
end

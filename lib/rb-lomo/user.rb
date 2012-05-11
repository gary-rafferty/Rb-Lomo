module Rb
  module Lomo
    class User

      attr_reader :username

      attr_reader :url

      attr_reader :avatar

      def initialize json_object
        @username = json_object['username']
        @url      = json_object['url']
        @avatar   = Avatar.new json_object['avatar']
      end
    end

    class Avatar

      attr_reader :url

      def initialize json_object
        @url   = json_object['url']
        @width = json_object['width']
        @height= json_object['height']
      end

      def size
        {
          width: @width,
          height: @height
        }
      end
    end
  end
end

module Rb
  module Lomo
    class Camera

      attr_reader :id

      attr_reader :name

      def initialize json
        @id         = json['id']
        @name       = json['name']
      end
    end
  end
end

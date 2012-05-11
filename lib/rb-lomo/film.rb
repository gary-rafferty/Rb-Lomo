module Rb
  module Lomo
    class Film

      attr_reader :id

      attr_reader :name

      def initialize json
        @id         = json['id']
        @name       = json['name']
      end
    end
  end
end

module BookImporters
  class Base
    class << self
      def provider
        self.name.demodulize
      end
    end
  end
end

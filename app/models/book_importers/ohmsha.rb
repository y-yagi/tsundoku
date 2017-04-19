module BookImporters
  class Ohmsha < Base
    class << self
      def get_title(page)
        page.search("h1").text
      end
    end
  end
end

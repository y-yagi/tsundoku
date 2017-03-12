module BookImporters
  class Pragprog < Base
    class << self
      def get_title(page)
        page.search("h1").first.text
      end
    end
  end
end

module BookImporters
  class Leanpub < Base
    class << self
      def get_title(page)
        page.search("h3.book-hero__title").text
      end
    end
  end
end

module BookImporters
  class GihyoDigitalPublishing < Base
    class << self
      def get_title(page)
        page.search("h1#bookTitle").text
      end
    end
  end
end

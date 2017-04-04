module BookImporters
  class Packt < Base
    class << self
      def get_title(page)
        page.search(".book-top-block-info-title > h1").first.text
      end
    end
  end
end

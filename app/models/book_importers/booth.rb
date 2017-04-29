module BookImporters
  class Booth < Base
    class << self
      def get_title(page)
        page.search(".section-head")&.text.presence || page.search(".item-name").first.text
      end
    end
  end
end

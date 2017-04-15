module BookImporters
  class Booth < Base
    class << self
      def get_title(page)
        page.search(".item-name").first.text
      end
    end
  end
end

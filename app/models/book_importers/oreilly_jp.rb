module BookImporters
  class OreillyJp < Base
    class << self
      def get_title(page)
        page.search(".title").text
      end
    end
  end
end

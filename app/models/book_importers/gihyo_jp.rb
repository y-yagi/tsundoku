module BookImporters
  class GihyoJp < Base
    class << self
      def get_title(page)
        page.search("h1.mainTitleBook").text
      end
    end
  end
end

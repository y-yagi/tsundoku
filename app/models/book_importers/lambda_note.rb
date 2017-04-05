module BookImporters
  class LambdaNote < Base
    class << self
      def get_title(page)
        page.search(".product-single__title").text
      end
    end
  end
end

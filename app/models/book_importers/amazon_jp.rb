module BookImporters
  class AmazonJp < Base
    class << self
      def import(url:, user:)
        asin = url.scan(/gp\/product\/(.*)\/|dp\/(.*)\//).flatten.compact.first
        raise "Unexpected Page: #{url}" unless asin

        title = fetch_title(asin)
        raise "Unexpected Page: #{url}" unless title

        Book.find_or_create_by!(title: title, user: user) do |book|
          book.item_url = url
          book.provider = provider
        end
      end

      def fetch_title(asin)
        item = nil
        Retryable.retryable(tries: 3, on: Amazon::RequestError) do
          item = Amazon::Ecs.item_lookup(asin)
        end
        item.get_element('ItemAttributes/Title').get
      end
    end
  end
end

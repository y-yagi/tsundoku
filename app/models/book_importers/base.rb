module BookImporters
  class Base
    class << self
      def import(url:, user:)
        agent = Mechanize.new
        page = agent.get(url)

        title = get_title(page)
        raise "Unexpected Page: #{url}" unless title

        Book.find_or_create_by!(title: title, user: user) do |book|
          book.item_url = url
          book.provider = provider
        end
      end

      def provider
        self.name.demodulize
      end

      def get_title(*)
        raise NotImplementedError
      end
    end
  end
end

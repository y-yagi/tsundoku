module BookImporters
  class OreillyJp < Base
    class << self
      def import(url:, user:)
        agent = Mechanize.new
        page = agent.get(url)

        title = page.search(".title").text
        raise "Unexpected Page: #{url}" unless title

        Book.find_or_create_by!(title: title, user: user) do |book|
          book.item_url = url
          book.provider = provider
        end
      end
    end
  end
end

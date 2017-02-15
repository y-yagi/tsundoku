module BookImporters
  class OreillyJp < Base
    class << self
      def import(url:, user:)
        agent = Mechanize.new
        page = agent.get(url)

        title = page.search(".title").text
        raise "Unexpected Page: #{url}" unless title

        Book.create!(title: title, item_url: url, provider: provider, user: user)
      end
    end
  end
end

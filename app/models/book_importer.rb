class BookImporter
  class << self
    def import(url:, user:)
      new(url: url, user: user).import
    end
  end

  def initialize(url:, user:)
    @url = url
    @user = user
  end

  def import
    if @url.match?("oreilly.co.jp")
      BookImporters::OreillyJp.import(url: @url, user: @user)
    else
      raise ArgumentError, "Unsupported Domain: #{@url}"
    end
  end
end

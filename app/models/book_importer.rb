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
    if @url.match?(%r|\Ahttps?://www\.oreilly\.co\.jp/|)
      BookImporters::OreillyJp.import(url: @url, user: @user)
    elsif @url.start_with?("https://www.amazon.co.jp")
      BookImporters::AmazonJp.import(url: @url, user: @user)
    elsif @url.start_with?("https://pragprog.com")
      BookImporters::Pragprog.import(url: @url, user: @user)
    elsif @url.start_with?("https://gihyo.jp/dp")
      BookImporters::GihyoDigitalPublishing.import(url: @url, user: @user)
    elsif @url.start_with?("https://www.packtpub.com")
      BookImporters::Packt.import(url: @url, user: @user)
    elsif @url.start_with?("https://www.lambdanote.com")
      BookImporters::LambdaNote.import(url: @url, user: @user)
    else
      raise ArgumentError, "Unsupported Domain: #{@url}"
    end
  end
end

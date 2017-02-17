Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'www.oreilly.co.jp'

    resource '/books/import',
      headers: :any,
      methods: [:post],
      credentials: true
  end
end

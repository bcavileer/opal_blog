class ArticlesNewController < Clearwater::Controller
  attr_accessor :article

  view { Articles::Views::New.new(model: @article = Articles::Model.new) }

  def create_article attributes
    HTTP.post(
        '/api/v1/articles',
        payload: { article: attributes },
        beforeSend: set_csrf_token
    ) do |response|
      # parent.fetch_articles
      article = Articles::Model.new(response.json)
      parent.add_article article
      router.navigate_to "/articles/#{article.id}"
    end
  end

  def update_attributes attributes
    attributes.each do |attr, value|
      article.public_send "#{attr}=", value
    end
  end
end

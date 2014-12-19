class ArticlesNewController < Clearwater::Controller
  attr_accessor :article

  view { ArticlesNewView.new(model: @article = Article.new) }

  def create_article attributes
    HTTP.post(
        '/api/v1/articles',
        payload: { article: attributes },
        beforeSend: set_csrf_token
    ) do |response|
      # parent.fetch_articles
      article = Article.new(response.json)
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

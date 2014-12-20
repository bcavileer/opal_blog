class ArticlesController < Clearwater::Controller
  view { ArticlesView.new }
  default_outlet { ArticlesIndexController.new }

  def loading_articles?
    @loading_articles
  end

  def articles
    return @articles if defined? @articles

    fetch_articles
    @articles ||= {}
  end

  def sorted_articles
    return @sorted_articles if @sorted_articles

    fetch_articles
    @sorted_articles ||= []
  end

  def fetch_articles
    @loading_articles = true

    HTTP.get('/api/v1/articles') do |response|
      @sorted_articles = response.json.map { |attributes|
        Articles::Model.new(attributes)
      }
      @articles = Hash[sorted_articles.map { |a| [a.id, a] }]

      @loading_articles = false
      call
    end
  end

  def add_article article
    articles[article.id] = article
    sorted_articles.unshift article
  end

  def delete_article article
    articles.delete article.id
    sorted_articles.delete article
    call
  end
end

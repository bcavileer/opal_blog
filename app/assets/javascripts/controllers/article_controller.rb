class ArticleController < Clearwater::Controller
  view { Articles::Views::Detail.new }

  def signed_in?
    parent.parent.signed_in?
  end

  def article
    articles[params[:id].to_i]
  end

  def articles
    parent.articles
  end

  def delete_article
    HTTP.delete(
        "/api/v1/articles/#{article.id}",
        beforeSend: set_csrf_token
    ) do |response|
      if response.ok?
        parent.delete_article article
        router.navigate_to '/articles'
      else
        alert response.error_message
      end
    end
  end
end

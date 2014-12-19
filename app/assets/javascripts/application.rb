require 'opal'
require 'jquery'
require 'opal-jquery'
require 'opal-slim'
require 'clearwater/application'

require_tree './views'
require 'models/article'
require 'models/product_category'
require 'models/user'

require 'controllers/application_index_controller'
require 'controllers/application_controller'
require 'controllers/articles_index_controller'
require 'controllers/articles_controller'
require 'controllers/article_controller'
require 'controllers/articles_new_controller'
require 'controllers/about_controller'
require 'controllers/categories_controller'
require 'controllers/store_controller'

router = Clearwater::Router.new do
  route 'articles' => ArticlesController.new do
    route 'new' => ArticlesNewController.new
    route ':id' => ArticleController.new
  end

  route 'store' => StoreController.new

  route 'session' => SessionController.new

  route 'about' => AboutController.new
end

OpalBlog = Clearwater::Application.new(router: router)

Document.ready? do
  OpalBlog.call
end

def benchmark message
  start = Time.now
  result = yield
  finish = Time.now
  puts "#{message} in #{(finish - start) * 1000}ms"
  result
end

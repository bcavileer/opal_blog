require 'opal'
require 'jquery'
require 'opal-jquery'
require 'opal-slim'
require 'clearwater/application'

require 'articles/model'
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

require 'views/about_view'
require 'views/application_index_view'
require 'views/application_view'
require 'articles/views/detail'
require 'articles/views/index'
require 'articles/views/new'
require 'articles/views/master'
require 'views/categories_view'
require 'views/session_view'
require 'views/store_view'

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

require 'clearwater/view'
require 'templates/master'

module Articles
  module Views
    class Master < Clearwater::View
      element '#articles-index'
      template 'master'
    end
  end
end

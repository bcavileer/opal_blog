require 'clearwater/view'
require 'templates/index'

module Articles
  module Views
    class Index < Clearwater::View
      template 'index'
    end
  end
end

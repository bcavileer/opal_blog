require 'clearwater/view'
require 'templates/detail'

module Articles
  module Views
    class Detail < Clearwater::View
      element '#article'
      template 'detail'

      def initialize
        super

        event :click, '#toggle-comments' do
          @comments_visible = !@comments_visible
          render
        end

        event :click, '#delete-article' do |event|
          delete_article
        end
      end

      def comments_visible?
        @comments_visible
      end
    end
  end
end

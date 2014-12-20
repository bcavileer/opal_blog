require 'clearwater/form_view'
require 'templates/new'

module Articles
  module Views
    class New < Clearwater::FormView
      element '#new-article-form'
      template 'new'

      def initialize
        super

        event :click, '#post-article' do |e|
          create_article article_attributes
          controller.article = @model = Articles::Model.new
        end

        event :keyup, '.attribute' do |e|
          e.stop_propagation
          update_attributes article_attributes
        end
      end

      def article_attributes
        {
            title: form_input(:title),
            body: form_input(:body),
        }
      end
    end
  end
end

require 'time'

module Articles
  class Model
    attr_reader :id, :created_at
    attr_accessor :title, :body

    def initialize attrs={}
      @id = attrs[:id]
      @title = attrs[:title]
      @body = attrs[:body]
      @created_at = Time.parse(attrs[:created_at])
    end
  end
end

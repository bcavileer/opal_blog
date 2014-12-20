class ArticlesIndexController < Clearwater::Controller
  view { Articles::Views::Index.new }
end

class HomeController < ApplicationController
  def index
  end

  def extract
    id = params[:q].sub(/\/$/,'').gsub(/.*\//,'')
    
    case params[:qq]['type']
    when 'cinii_articles'
      @result = Sist02::CiNii.article_ref(id)
    when 'cinii_books'
      @result = Sist02::CiNii.book_ref(id)
    when 'cinii_dessertations'
      @result = Sist02::CiNii.dissertations_ref(id)
    else
      @result = ''
    end
  end
end

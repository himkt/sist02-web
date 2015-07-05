class HomeController < ApplicationController
  def index
  end

  def extract
    id = params[:q].sub(/\/$/,'').gsub(/.*\//,'')
    @type = params[:qq]['type']

    case @type
    when 'cinii_articles'
      begin
        @result = Sist02::CiNii.article_ref(id)
      rescue => e
        @result = e
      end
    when 'cinii_books'
      begin
        @result = Sist02::CiNii.book_ref(id)
      rescue => e
        @result = e
      end
    when 'cinii_dessertations'
      begin
        @result = Sist02::CiNii.dissertations_ref(id)
      rescue => e
        @result = e
      end
    else
      @result = 'Error'
    end
  end
end

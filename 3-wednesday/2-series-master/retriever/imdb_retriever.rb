
require "imdb"

class ImdbRetriever
  def get_serie(title)
    return if title.nil?
    results = Imdb::Search.new(title).movies
    if results.size == 0
      return nil
    end
    get_serie_by_id(results[0].id)
  end

  def get_many_series(titles)
    return if titles.nil?
    series = []
    titles.each do |title|
      serie = get_serie(title)
      if serie
        series << serie
      end
    end
    series
  end

  private

  def get_serie_by_id(id)
    return if id.nil?
    serie_raw = Imdb::Serie.new(id)
    if serie_raw.title.nil?
      return nil
    end
    serie_raw
  end
end

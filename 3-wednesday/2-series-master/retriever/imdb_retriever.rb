
require "imdb"

require "./model/serie"

class ImdbRetriever
  def get_serie(title)
    return if title.nil?
    results = Imdb::Search.new(title).movies
    if results.size == 0
      return nil
    end
    serie_raw = results[0]
    Serie.new(serie_raw.id, serie_raw.title, serie_raw.rating)
  end

  def get_serie_by_id(id)
    return if id.nil?
    serie_raw = Imdb::Serie.new(id)
    if serie_raw.title.nil?
      return nil
    end
    serie_raw
  end
end

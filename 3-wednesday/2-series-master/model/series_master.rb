
class SeriesMaster
  def initialize(series_retriever)
    @series_retriever = series_retriever
  end

  def best_serie(series)
    return if series.size == 0
    best_serie = nil
    series.each do |title|
      serie_raw = @series_retriever.get_serie(title)
      aspiring_serie = Serie.new(serie_raw.id, serie_raw.title, serie_raw.rating)
      best_serie = get_best_of_two(best_serie, aspiring_serie)
    end
    best_serie
  end

  def first_chapter(serie_title)
    return if serie_title.nil?
    serie_raw = @series_retriever.get_serie(serie_title)
    if serie_raw
      serie = @series_retriever.get_serie_by_id(serie_raw.id)
      if serie
        return serie.season(1).episode(1).title
      end
    end
    nil
  end

  def get_best_of_two(best_serie, aspiring_serie)
    return aspiring_serie if best_serie.nil? || best_serie.rating < aspiring_serie.rating
    return best_serie
  end
end

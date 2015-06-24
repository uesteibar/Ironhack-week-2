
class SeriesMaster
  def initialize(series_retriever)
    @series_retriever = series_retriever
  end

  def best_serie(series)
    return if series.size == 0
    best_serie = nil
    series.each do |title|
      serie_raw = @series_retriever.get_serie(title)
      best_serie = get_best_of_two(best_serie, serie_raw)
    end
    best_serie
  end

  def first_chapter(serie_title)
    return if serie_title.nil?
    serie_raw = @series_retriever.get_serie(serie_title)
    if serie_raw
        return serie_raw.season(1).episode(1).title
    end
    nil
  end

  def most_seasons(series)
    return if series.nil?
    ((@series_retriever.get_many_series(series).sort_by {|serie| serie.seasons.size}).reverse)[0]
  end

  def most_episodes(series)
    return if series.nil?
    ((@series_retriever.get_many_series(series).sort_by {|serie| count_episodes(serie)}).reverse)[0]
  end


  private

  def get_best_of_two(best_serie, aspiring_serie)
    return aspiring_serie if best_serie.nil? || best_serie.rating < aspiring_serie.rating
    return best_serie
  end

  def count_episodes(serie)
    serie.seasons.reduce(0) do |sum, season|
      sum += season.episodes.size
    end
  end
    
end

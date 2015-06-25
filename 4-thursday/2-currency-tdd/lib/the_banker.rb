
class TheBanker
  def initialize(currency_provider)
    @currency_provider = currency_provider
  end

  def convert(amount, from_currency, to_currency)
    return if amount.nil? || from_currency.nil? || to_currency.nil?
    if from_currency == :euro
      return from_euro(amount, to_currency)
    elsif to_currency == :euro
      return to_euro(amount, from_currency)
    else
      return from_currency_to_currency(amount, from_currency, to_currency)
    end
  end

  private

  def from_euro(amount, currency)
    from_euro_value = @currency_provider.from_euro(currency)
    return if from_euro_value.nil?
    amount * from_euro_value
  end

  def to_euro(amount, currency)
    to_euro_value = @currency_provider.to_euro(currency)
    return if to_euro_value.nil?
    amount * to_euro_value
  end

  def from_currency_to_currency(amount, from_currency, to_currency)
    from_euro_value = @currency_provider.from_euro(from_currency)
    to_euro_value = @currency_provider.to_euro(to_currency)
    return if from_euro_value.nil? || to_euro_value.nil?

    if from_euro_value && to_euro_value
      return from_euro(to_euro(amount, from_currency), to_currency)
    end
  end
end

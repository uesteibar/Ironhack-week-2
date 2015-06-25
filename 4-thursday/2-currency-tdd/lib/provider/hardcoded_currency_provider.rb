
class HardcodedCurrencyProvider

  def initialize
    @to_euro = {
      usd: 0.77818,
      gbp: 1.27341,
      cad: 0.70518,
      aud: 0.69052
    }

    @from_euro = {
      usd: 1.28356,
      gbp: 0.78478,
      cad: 1.41613,
      aud: 1.44651
    }
  end

  def to_euro(currency)
    @to_euro[currency]
  end

  def from_euro(currency)
    @from_euro[currency]
  end
end

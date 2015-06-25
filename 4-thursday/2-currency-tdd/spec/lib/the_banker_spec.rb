
require "./lib/the_banker"
require "./lib/provider/hardcoded_currency_provider"

describe TheBanker do
  before do
    @the_banker = TheBanker.new(HardcodedCurrencyProvider.new)
  end

  describe '#convert' do
    it 'should convert from euro to any currency' do
      expect(@the_banker.convert(2, :euro, :usd)).to eq 2.56712
    end

    it 'should convert from any currency to euro:' do
      expect(@the_banker.convert(2.56712, :usd, :euro)).to eq 1.9976814416
    end

    it 'should convert from a currency other than euro to another' do
      expect(@the_banker.convert(2, :cad, :usd)).to eq 1.8102816816
    end

    it 'should return nil when any of the parameters is nil' do
      expect(@the_banker.convert(nil, :cad, nil)).to eq nil
    end

    it 'should return nil when any of the currencies is unknown' do
      expect(@the_banker.convert(1, :pesetitas, :euro)).to eq nil
    end
  end
end

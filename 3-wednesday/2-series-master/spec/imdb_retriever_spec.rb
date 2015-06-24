
require "./retriever/imdb_retriever"

describe ImdbRetriever do
  before do
    @retriever = ImdbRetriever.new
  end
  describe "#get_serie" do
    it "should get a serie when provided a proper title" do
      expect(@retriever.get_serie("breaking bad").title).to eq("Breaking Bad (2008) (TV Series)")
    end

    it "should return nil when no serie found" do
        expect(@retriever.get_serie("uesteibar rules")).to eq(nil)
    end

    it "should return nil when provided a nil title" do
        expect(@retriever.get_serie(nil)).to eq(nil)
    end
  end

  describe "#get_serie_by_id" do
    it "should get a serie when provided a proper id" do
      expect(@retriever.get_serie_by_id("0903747").title).to eq("\"Breaking Bad\"")
    end

    it "should return nil when no serie found" do
        expect(@retriever.get_serie_by_id("23432423423423342342424242432")).to eq(nil)
    end

    it "should return nil when nil id provided" do
        expect(@retriever.get_serie_by_id(nil)).to eq(nil)
    end
  end
end

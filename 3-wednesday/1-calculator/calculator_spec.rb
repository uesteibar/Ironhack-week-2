require "./calculator"

describe Calculator do

  before do
    @calculator = Calculator.new
  end
  
  describe "#sum" do
  	context "when we are using proper numbers" do
  		it "should work with two numbers" do
	     expect(@calculator.sum(1, 2)).to eq(3) 
      end
  	end

    context "when we are using non-numeric stuff" do
      it "should work with nil and a number" do
        expect(@calculator.sum(nil, 1)).to eq(1)
      end

      it "should work with a number and nil" do
        expect(@calculator.sum(1, nil)).to eq(1)
        expect(@calculator.sum(nil, nil)).to eq(nil)
      end

      it "should work with both nil" do
        expect(@calculator.sum(nil, nil)).to eq(nil)
      end

      it "should work with other non-numic parameters" do
        expect(@calculator.sum(:dog, nil)).to eq(nil)
      end
    end
  end

  describe "#substract" do
    it "should work with two numbers" do
     expect(@calculator.substract(1, 2)).to eq(-1) 
    end

    it "should work with not numeric stuff" do
      expect(@calculator.substract(nil, :dog)).to eq(nil)
    end
  end

  describe "#multiply" do
    it "should work with two numbers" do
     expect(@calculator.multiply(3, 2)).to eq(6) 
    end

    it "should work with not numeric stuff" do
      expect(@calculator.multiply(nil, :dog)).to eq(nil)
    end
  end

  describe "#division" do
    context "when we are using proper numbers" do
      it "should work with a divisor other than zero" do
       expect(@calculator.divide(3, 2)).to eq(1.5) 
      end

      it "should work with a divisor equal to zero" do
       expect(@calculator.divide(3, 0)).to eq(nil) 
      end
    end

    context "when we are using non-numeric stuff" do
      it "should work with non-numeric values" do
        expect(@calculator.divide(nil, :dog)).to eq(nil)
      end
    end
  end

  describe "#mode" do
    context "when we are using proper numbers" do
      it "should work if we provide a fair winner" do
        expect(@calculator.mode([2, 3, 2, 3, 3, 2, 4, 3])).to eq(3)
      end

      it "should work if we provide an even" do
        expect(@calculator.mode([2, 3, 2, 3, 3, 2, 4])).to eq(2)
      end
    end

    context "when we are using non-numeric stuff" do
      it "should work with non-numeric values" do
        expect(@calculator.mode([2, 3, 2, :catdog, 3, 2, 4])).to eq(nil)
      end
    end
  end

  describe "#average" do
    it "should work with numeric values" do
      expect(@calculator.average([1, 2])).to eq(1.5)
    end

    it "should work with an empty array" do
      expect(@calculator.average([])).to eq(nil)
    end

    it "should work with non-numeric values" do
      expect(@calculator.average([1, :symbol])).to eq(nil)
    end
  end

  describe "#median" do
    context "when we provide all proper numbers" do
      it "should work with odd amount of numbers" do
        expect(@calculator.median([3, 1, 2])).to eq(2)
      end
      
      it "sould work with even amount of numbers" do
        expect(@calculator.median([3, 1, 2, 4])).to eq(2.5)
      end
    end

    context "when we don't provide all proper numbers" do
      it "sould work with empty array" do
        expect(@calculator.median([])).to eq(nil)
      end

      it "sould work with non-numeric values" do
        expect(@calculator.median([:symbol, 1, 3, "hola"])).to eq(nil)
      end
    end
  end
end

describe Wealthsimple::Configuration do
  describe ".configure" do
    it "sets global config" do
      expect(Wealthsimple.config.env).to be_nil

      Wealthsimple.configure do |config|
        config.env = :production
      end

      expect(Wealthsimple.config.env).to eq(:production)

      Wealthsimple.configure do |config|
        config.env = :sandbox
      end

      expect(Wealthsimple.config.env).to eq(:sandbox)
    end
  end
end

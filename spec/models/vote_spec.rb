describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        # your expectations here
        vote = Vote.new(value: 1)
        expect(vote.valid?).eq true
        vote = Vote.new(value: -1)
        expect(vote.valid?).eq true
        vote = Vote.new(value: 2)
        expect(vote.valid?).eq false
        vote = Vote.new(value: -2)
        expect(vote.valid?).eq false
      end
    end
  end
end
require "rspec"
require_relative "./buggy_voting.rb"

empty_voters = []

voters = [
	[:dem, :ind, :rep],
    [:rep, :ind, :dem],
    [:ind, :dem, :rep],
    [:ind, :rep, :dem]]

tough_votes = [
	[:a, :c, :b, :d, :e],
	[:d, :c, :a, :b, :e],
	[:e, :b, :d, :a, :c],
	[:e, :a, :b, :c, :d],
	[:b, :c, :e, :a, :d]]

tie_voters = [
	[:a, :c, :d, :e, :b],
	[:e, :b, :d, :c, :a],
	[:d, :e, :c, :a, :b],
	[:c, :e, :d, :b, :a],
	[:b, :e, :a, :c, :d]]

describe "Voting count" do
	it "should work with empty votes" do
		expect(runoff(empty_voters)).to be_nil
	end

	it "should work with easy votes" do
		expect(runoff(voters)).to equal(:ind)
	end

	it "should work with weird votes" do
		expect(runoff(tough_votes)).to equal(:e)
	end

	it "should work with tied votes" do
		expect(runoff(tie_voters)).to be_nil
	end
end

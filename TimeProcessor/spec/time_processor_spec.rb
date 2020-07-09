# spec/time_processor_spec.rb
require "time_processor"
describe TimeProcessor do

  describe ".add_minutes" do
    context "given morning hours" do
      it "returns appropriate time" do
        expect(TimeProcessor.add_minutes("9:13 AM", 10)).to eql("9:23 AM")
        expect(TimeProcessor.add_minutes("8:13 AM", -10)).to eql("8:03 AM")
      end
    end

    context "given evening hours" do
      it "returns appropriate time" do
        expect(TimeProcessor.add_minutes("6:04 PM", 5)).to eql("6:09 PM")
        expect(TimeProcessor.add_minutes("7:05 PM", -10)).to eql("6:55 PM")
      end
    end

    context "given noon hours" do
      it "returns appropriate time" do
        expect(TimeProcessor.add_minutes("11:55 AM", 10)).to eql("12:05 PM")
        expect(TimeProcessor.add_minutes("11:55 AM", 5)).to eql("12:00 PM")
        expect(TimeProcessor.add_minutes("12:05 PM", -5)).to eql("12:00 PM")
        expect(TimeProcessor.add_minutes("12:05 PM", -14)).to eql("11:51 AM")
      end
    end

    context "given midnight hours" do
      it "returns appropriate time" do
        expect(TimeProcessor.add_minutes("11:55 PM", 10)).to eql("12:05 AM")
        expect(TimeProcessor.add_minutes("11:55 PM", 5)).to eql("12:00 AM")
        expect(TimeProcessor.add_minutes("12:05 AM", -5)).to eql("12:00 AM")
        expect(TimeProcessor.add_minutes("12:05 AM", -14)).to eql("11:51 PM")
      end
    end

    context "given minutes beyond the existing day" do
      it "returns appropriate time" do
        expect(TimeProcessor.add_minutes("7:05 AM", 1441)).to eql("7:06 AM")
        expect(TimeProcessor.add_minutes("7:05 AM", -1441)).to eql("7:04 AM")
      end
    end
  end
end

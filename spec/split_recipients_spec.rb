require "spec_helper"

describe SplitRecipients, "#call" do
  it "splits on commas" do
    recipients = "one@example.com,two@example.com"

    result = SplitRecipients.new(recipients).call

    expect(result).to eq(["one@example.com", "two@example.com"])
  end

  it "splits on newlines" do
    recipients = "one@example.com\ntwo@example.com"

    result = SplitRecipients.new(recipients).call

    expect(result).to eq(["one@example.com", "two@example.com"])
  end

  it "splits on semicolons" do
    recipients = "one@example.com;two@example.com"

    result = SplitRecipients.new(recipients).call

    expect(result).to eq(["one@example.com", "two@example.com"])
  end

  it "strips spaces" do
    recipients = "  one@example.com;  two@example.com  "

    result = SplitRecipients.new(recipients).call

    expect(result).to eq(["one@example.com", "two@example.com"])
  end
end

class SplitRecipients
  WHITESPACE = /\s+/
  DELIMITERS = /[\n,;]+/

  def initialize(recipients)
    @recipients = recipients
  end

  def call
    recipients.split(DELIMITERS).map do |recipient|
      recipient.gsub(WHITESPACE, "")
    end
  end

  private

  attr_reader :recipients
end

require 'spec_helper'

describe SurveyInviter, '#valid?' do
  it 'is invalid with any invalid recipients' do
    inviter = with_recipients('invalid, valid@example.com')
    expect(inviter).not_to be_valid
  end

  it 'is invalid without a domain' do
    inviter = with_recipients('user@')
    expect(inviter).not_to be_valid
  end

  it 'is invalid without a user' do
    inviter = with_recipients('@example.com')
    expect(inviter).not_to be_valid
  end

  it 'is invalid with an invalid tld' do
    inviter = with_recipients('user@invalid.x')
    expect(inviter).not_to be_valid
  end

  it 'is invalid without a message' do
    inviter = SurveyInviter.new(message: '', recipients: 'user@example.com')
    expect(inviter).not_to be_valid
  end

  it 'is valid with a message and recipients' do
    inviter =
      SurveyInviter.new(message: 'valid', recipients: 'user@example.com')
    expect(inviter).to be_valid
  end

  it 'is valid with a subdomain' do
    inviter = with_recipients('user@subdomain.example.com')
    expect(inviter).to be_valid
  end

  def with_recipients(recipients)
    SurveyInviter.new(message: 'valid', recipients: recipients)
  end
end

describe SurveyInviter, '#deliver' do
  it 'invites recipients' do
    survey = build(:survey)
    sender = build(:sender)
    message = 'Take my survey!'
    recipient = 'one@example.com'
    invitation = stub_invitation

    deliver(
      survey: survey,
      sender: sender,
      message: message,
      recipients: recipient
    )

    expect_invitations_to(
      [recipient],
      survey: survey,
      sender: sender,
      status: 'pending'
    )
    expect(Mailer).
      to have_received(:invitation_notification).
        with(invitation, message)
  end

  it 'splits on commas' do
    stub_invitation
    deliver(recipients: 'one@example.com,two@example.com')
    expect_invitations_to(['one@example.com', 'two@example.com'])
  end

  it 'splits on semicolons' do
    stub_invitation
    deliver(recipients: 'one@example.com;two@example.com')
    expect_invitations_to(['one@example.com', 'two@example.com'])
  end

  it 'strips spaces' do
    stub_invitation
    deliver(recipients: '  one@example.com;  two@example.com  ')
    expect_invitations_to(['one@example.com', 'two@example.com'])
  end

  def deliver(attributes = {})
    SurveyInviter.new(
      survey: attributes[:survey] || build(:survey),
      sender: attributes[:sender] || build(:sender),
      message: attributes[:message] || 'Take my survey!',
      recipients: attributes[:recipients] || 'user@example.com'
    ).deliver
  end

  def stub_invitation
    double('invitation').tap do |invitation|
      allow(Invitation).to receive(:create).and_return(invitation)
      allow(Mailer).to receive(:invitation_notification)
    end
  end

  def expect_invitations_to(recipients, attributes = {})
    recipients.each do |recipient|
      expect(Invitation).to have_received(:create).with(
        hash_including(attributes.merge(recipient_email: recipient))
      )
    end
  end
end

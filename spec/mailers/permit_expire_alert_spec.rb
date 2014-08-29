require "spec_helper"
describe PermitExpireAlert do
  describe 'instructions' do
    let(:user) { user = create(:user) }
    let(:document) { document = create(:document) }
    let(:mail) { PermitExpireAlert.alert_email(user, document)}
    it 'renders the receiver email' do
      expect(mail.to).to eql([user.email])
    end
    it 'should set the subject to the correct subject' do
      expect(mail.subject).to eql('Permit Expiration Alert - @document')
    end
    it 'renders the sender email' do
      expect(mail.from).to eql(['notifications@compliance-safe.com']) 
    end
    it 'should have literal content' do
      expect(mail.body.encoded).to match('Compliance Safe')
    end
  end

end

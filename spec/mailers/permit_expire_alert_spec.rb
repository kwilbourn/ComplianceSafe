require "spec_helper"
describe PermitExpireAlert do
  describe 'Email output' do
    before do
      @document = FactoryGirl.create(:document)
      @user = FactoryGirl.create(:admin)
      post :create, {:permit_expire_alert => {:alert_email.user => @user, :alert_email.document => @document}}
       
    end
    it 'renders the receiver email' do
      expect(@mail.to).to eql([@user.email])
    end
    it 'should set the subject to the correct subject' do
      expect(@mail.subject).to match('Permit Expiration Alert for Permit Number 12345 Permit Number')
    end
    it 'renders the sender email' do
      expect(@mail.from).to eql(['notifications@compliance-safe.com']) 
    end
    it 'should have literal content' do
      expect(@mail.body.encoded).to match('Compliance Safe')
    end
    it 'should have variable content' do
      expect(@mail.body.encoded).to match((Date.today + 100.days).to_s)
    end
  end
end

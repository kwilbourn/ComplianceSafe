require "spec_helper"
describe PermitExpireAlert do
  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
    @user = {:email => 'kwilbourn@cmsistores.com', :first_name => 'Kevin'}
    @document = {:permit_number => '1234', :expiration_date => '2014-12-31'} 
    PermitExpireAlert.alert_email(@user, @document).deliver
  end
  after(:each) do
    ActionMailer::Base.deliveries.clear
  end
  it 'should send an email' do
    ActionMailer::Base.deliveries.count.should == 1
  end
  it 'renders the receiver email' do
    ActionMailer::Base.deliveries.first.to.should == @user.email
  end
  it 'should set the subject to the correct subject' do
    ActionMailer::Base.deliveries.first.subject.should == 'Permit Expiration Alert - @document'
  end
  it 'renders the sender email' do
    ActionMailer::Base.deliveries.first.from.should == ['notifications@compliance-safe.com'] 
  end
  

end

require 'spec_helper'

feature 'Emailer' do
  background do
    clear_emails
    visit email_trigger_path
    open_email('kevinwilbourn@gmail.com')
  end
  
  scenario 'testing for content' do
    expect(current_email).to have_content 'Hello Joe!'
  end
  
  scenario 'testing for a custom header' do
    expect(current_email.headers).to include 'header-key'
    
  end
  
  scenario 'testing for a custom header value' do
    expect(current_email.headers('header-key')).to eq 'header-value'
  end
  
end

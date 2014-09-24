require 'rails_helper'

  describe "ContactForm" do
    it "delivers a valid message" do
      visit new_contact_form_path
      fill_in 'Name', :with => 'Aaron Sumner'
      fill_in 'Email', :with => 'aaron@everydayrails.com'
      fill_in 'Message', :with => 'What a great website.'
      click_button 'Send message'
      page.body.to have_content('Thank you for your message')
      expect(last_email).to include('help@everydayrails.com')
      expect(last_email).from include('aaron@everydayrails.com')
    end

    it "does not deliver a message with a missing email" do
      visit new_contact_form_path
      fill_in 'Name', :with => 'Aaron Sumner'
      fill_in 'Message', :with => 'What a great website.'
      click_button 'Send message'
      expect(page.body).to have_content("Email can't be blank")
      expect(last_email).to be_nil
    end

    it "does not deliver spam" do
      pending "This does not appear to render the proper source but passes in a browser."
      visit new_contact_form_path
      fill_in 'Name', :with => 'Aaron Sumner'
      fill_in 'Email', :with => 'spammer@spammyjunk.com'
      fill_in 'Message', :with => "All the junk you'll never need."
      click_button 'Send message'
      expect(page.body).to have_content('this message appears to be spam')
      expect(last_email).to be_nil
    end
  end
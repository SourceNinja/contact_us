require 'spec_helper'

describe "Contacts pages" do
  describe "GET /contacts pages" do
    it "is allowed for anonymous user" do
      get new_contact_path

      response.status.should be(200)
    end
  end

  describe "GET contacts index" do
    it "is not allowed for anonymous user" do
      get contacts_path

      response.status.should be(302)
      response.should redirect_to(new_admin_session_path)
    end
  end

  describe "Form verification" do
    it "should require a name" do
      get new_contact_path

      fill_in :email, :with => 'joe@joepublic.com'
      fill_in :phone, :with => '6505558901'
      click_button

      response.should have_selector("li", :content => %q{Name can't be blank})
    end

    it "should require an email address" do
      get new_contact_path

      fill_in :name,  :with => 'Joe Public'
      fill_in :phone, :with => '6505558901'
      click_button

      response.should have_selector("li", :content => %q{Email can't be blank})
    end

    it "should require a valid-ish email address" do
      get new_contact_path

      fill_in :name,  :with => 'Joe Public'
      fill_in :email, :with => 'joe@'
      fill_in :phone, :with => '6505558901'
      click_button

      response.should have_selector("li", :content => %q{Email is invalid})
    end

    it "should require a phone number" do
      get new_contact_path

      fill_in :name,  :with => 'Joe Public'
      fill_in :email, :with => 'joe@joepublic.com'
      click_button

      response.should have_selector("li", :content => %q{Phone can't be blank})
    end

    it "should accept valid parameters" do
      get new_contact_path

      fill_in :name,    :with => 'Joe Public'
      fill_in :company, :with => 'Public Company Number One, Inc.'
      fill_in :email,   :with => 'joe@joepublic.com'
      fill_in :phone,   :with => '(650) 555-3456'
      click_button

      response.should be_success
      response.body.should =~ %r{thank you}i
    end

  end


end

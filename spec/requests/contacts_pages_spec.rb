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

end

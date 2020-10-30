require 'rails_helper'

RSpec.describe "Slot Create", :type => :request do

  it "creates a Slot" do
    headers = { "ACCEPT" => "application/json" }
    post "/api/doctors/:doctor_id/slots", :params => { :slot => {:message => "Slot Created"} }, :headers => headers

    expect(response.content_type) == "application/json"
    expect(response).to have_http_status(200)
  end

end
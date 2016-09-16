require 'rails_helper'

RSpec.describe Api::V1::TasksController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :show, id: '9f0afa07-235b-4c1f-82a9-3e95f1b56698', format: :json
      expect(response).to have_http_status(:success)

      expected_output = {
        "id"          => 17,
        "description" => "Operatie cancel",
        "entry"       => "2016-09-12T13:27Z",
        "modified"    => "20160912T133921Z",
        "project"     => "public_api.2_0",
        "status"      => "pending",
        "uuid"        => "9f0afa07-235b-4c1f-82a9-3e95f1b56698",
        "website"     => "ugo",
        "annotations" => [{
          "entry"       => "2016-09-12T13:27Z",
          "description" => "Gaat die op order of op trip-niveau?"
        }, {
          "entry"       => "2016-09-12T13:39Z",
          "description" => "Probeer gebruik te maken van de annulerings-functionaliteit van Alexander"
        }],
        "urgency" => 1.92192
      }

      expect(JSON.parse(response.body)).to eq(expected_output)
    end
  end
end

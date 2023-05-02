require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET /names" do
    it 'returns 200 OK' do
      response = get('/names')
      
      expect(response.status).to eq(200)

      expected_response = "Julia, Mary, Karim"
      expect(response.body).to eq(expected_response)
    end
  end
  
  context "GET to /" do
    it "should return 'Hello George'" do
      # Send a GET request to /
      # and returns a response object we can test.
      response = get("/hello?name=George")

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to eq("Hello George")
    end

    it "should return 'Hello Aphra'" do
      response = get("/hello?name=Aphra")

      expect(response.status).to eq(200)
      expect(response.body).to eq("Hello Aphra")
    end
  end

  context "POST to /submit" do
    it "returns 200 OK with the right content" do
      # Send a POST request to /submit
      # with some body parameters
      # and returns a response object we can test.
      response = post("/submit", artist_name: "Aphex Twin", the_number: 42)

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to eq("Thanks Aphex Twin, you sent this message: 42")
    end
  end
end
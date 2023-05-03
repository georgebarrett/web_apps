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
  
  # context "GET to /" do
  #   it "should return 'Hello George'" do
  #     # Send a GET request to /
  #     # and returns a response object we can test.
  #     response = get("/hello?name=George")

  #     # Assert the response status code and body.
  #     expect(response.status).to eq(200)
  #     expect(response.body).to eq("Hello George")
  #   end

  #   it "should return 'Hello Aphra'" do
  #     response = get("/hello?name=Aphra")

  #     expect(response.status).to eq(200)
  #     expect(response.body).to eq("Hello Aphra")
  #   end
  # end

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

  context 'POST to /sort-names' do
    it 'returns a sorted list of names' do
      
      response = post("/sort-names", names: "Joe, Alice, Zoe, Julia, Kieran")

      expect(response.status).to eq (200)
      expect(response.body).to eq("Alice, Joe, Julia, Kieran, Zoe")

    end
  end

  context 'GET to /hello' do
    it 'returns 200 OK' do
      response = get('/hello')

      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Hello!</h1>')
    end
  end
end

# # Request:
# POST http://localhost:9292/sort-names

# # With body parameters:
# names=Joe,Alice,Zoe,Julia,Kieran

# # Expected response (sorted list of names):
# Alice,Joe,Julia,Kieran,Zoe
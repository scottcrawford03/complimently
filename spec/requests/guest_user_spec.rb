require "rails_helper"

RSpec.feature "Widget management", :type => :request do
  context 'guest user' do
    it 'has a welcome page' do
      get '/'
      expect(response.status).to eq(200)
    end

    it 'does not give access to compliments' do
      get '/user/compliments'
      expect(response.status).to eq(302)
    end

    it 'does not give access to admin' do
      get '/user/compliments'
      expect(response.status).to eq(302)
    end

    it 'does not give access to random' do
      get '/user/nick/cage'
      expect(response.status).to eq(301)
    end
  end
end

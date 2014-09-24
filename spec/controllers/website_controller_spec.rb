require 'rails_helper'

RSpec.describe WebsiteController, :type => :controller do
  describe "#index" do
    context "in the morning" do
      before :example do
        allow(Time).to receive(:now).and_return(Time.parse "13 Sep 2014 05:07")
      end

      it "returns 'good morning'" do
        get :index
        expect(assigns(:greeting)).to eq('good morning')
      end
    end

    context "in the afternoon" do
      before :example do
        allow(Time).to receive(:now).and_return(Time.parse "13 Sep 2014 13:37")
      end

      it "returns 'good afternoon'" do
        get :index
        expect(assigns(:greeting)).to eq('good afternoon')
      end
    end

    context "in the evening" do
      before :example do
        allow(Time).to receive(:now).and_return(Time.parse "13 Sep 2014 01:38")
      end

      it "returns 'good evening'" do
        get :index
        expect(assigns(:greeting)).to eq('good evening')
      end
    end
  end
end

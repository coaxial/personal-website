require 'rails_helper'

RSpec.describe WebsiteController, :type => :controller do
  describe "#index" do
    after :each do
      Timecop.return
    end

    context "in the morning" do
      before do
        Timecop.freeze(Time.new(2014, 9, 13, 5, 7, 0,'-04:00'))
      end

      it "returns 'good morning'" do
        get :index
        expect(assigns(:greeting)).to eq('good morning')
      end
    end

    context "in the afternoon" do
      before do
        Timecop.freeze(Time.new(2014, 9, 13, 13, 37, 0,'-04:00'))
      end

      it "returns 'good afternoon'" do
        get :index
        expect(assigns(:greeting)).to eq('good afternoon')
      end
    end

    context "in the evening" do
      before do
        Timecop.freeze(Time.new(2014, 9, 13, 1, 37, 0,'-04:00'))
      end

      it "returns 'good evening'" do
        get :index
        expect(assigns(:greeting)).to eq('good evening')
      end
    end
  end
end

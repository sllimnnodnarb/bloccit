require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let (:advertisement) { Advertisement.create! }

  describe "attributes" do
    it "responds to title attribute" do
      expect(advertisement).to respond_to(:title)
    end

    it "responds to body attribute" do
      expect(advertisement).to respond_to(:body)
    end

    it "responds to price attribute" do
      expect(advertisement).to respond_to(:price)
    end
  end

  desribe "POST create" do
    it "increments total ads by one" do
      expect {post :create, advertisement: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 100}}.to change(Advertisement, :count).by(1)
    end

    it "assigns new advertisement to @advertisement" do
      post :create, advertisement: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 100}
      expect(assigns(:advertisement)).to eq Advertisement.last
    end

    it "redirects to the newly created advertisement" do
      post :create, advertisement: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 100}
      expect(response).to redirect_to Advertisement.last
    end
  end

end

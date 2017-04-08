require 'rails_helper'
include RandomData
RSpec.describe AdvertisementsController, type: :controller do

  let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:my_ad) { my_topic.advertisements.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }

  describe "GET show" do
    it "returns http success" do
      get :show, topic_id: my_topic.id, id: my_ad.id
      expect(response).to have_http_status(:success)
    end

    it "renders #show view" do
      get :show, topic_id: my_topic.id, id: my_ad.id
      expect(response).to render_template :show
    end

    it "assigns my_ad to @advertisement" do
      get :show, topic_id: my_topic.id, id: my_ad.id
      expect(assigns(:advertisement)).to eq(my_ad)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new, topic_id: my_topic.id
      expect(response).to have_http_status(:success)
    end

    it "renders #new view" do
      get :new, topic_id: my_topic.id
      expect(response).to render_template :new
    end

    it "instantiates @advertisement" do
      get :new, topic_id: my_topic.id
      expect(assigns(:advertisement)).not_to be_nil
    end
  end

  describe "Advertisement create" do
    it "increases the number of Advertisements by 1" do
      expect{post :create, topic_id: my_topic.id, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(Advertisement,:count).by(1)
    end

    it "assigns the new advertisement to @advertisement" do
      post :create, topic_id: my_topic.id, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(assigns(:advertisement)).to eq Advertisement.last
    end

    it "redirects to the new advertisement" do
      post :create, topic_id: my_topic.id, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(response).to redirect_to [my_topic, Advertisement.last]
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, topic_id: my_topic.id, id: my_ad.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, topic_id: my_topic.id, id: my_ad.id
      expect(response).to render_template :edit
    end

    it "assigns advertisement to be updated to @advertisement" do
      get :edit, topic_id: my_topic.id, id: my_ad.id
      advertisement_instance = assigns(:advertisement)
      expect(advertisement_instance.id).to eq my_ad.id
      expect(advertisement_instance.title).to eq my_ad.title
      expect(advertisement_instance.body).to eq my_ad.body
    end
  end

  describe "PUT update" do
    it "updates advertisement with expected attributes" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
      put :update, topic_id: my_topic.id, id: my_ad.id, advertisement: {title: new_title, body: new_body}
      updated_advertisement = assigns(:advertisement)
      expect(updated_advertisement.id).to eq my_ad.id
      expect(updated_advertisement.title).to eq new_title
      expect(updated_advertisement.body).to eq new_body
    end

    it "redirects to the updated advertisement" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
      put :update, topic_id: my_topic.id, id: my_ad.id, advertisement: {title: new_title, body: new_body}
      expect(response).to redirect_to [my_topic, my_ad]
    end
  end

   describe "DELETE destroy" do
      it "deletes the advertisement" do
        delete :destroy, topic_id: my_topic.id, id: my_ad.id
        count = Advertisement.where({id: my_ad.id}).size
        expect(count).to eq 0
      end

      it "redirects to topic show" do
        delete :destroy, topic_id: my_topic.id, id: my_ad.id
        expect(response).to redirect_to my_topic
      end
    end

end

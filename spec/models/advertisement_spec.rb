require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let(:title) { RandomData.random_sentence }
  let(:body) { RandomData.random_paragraph }
  let(:advertisement) { Advertisement.create!(title: title, body: body, price: 100) }

  it { is_expected.to belong_to(:topic) }

  describe "attributes" do
    it "has title, body, and price attributes" do
       expect(advertisement).to have_attributes(title: title, body: body, price: 100)
    end
  end

end

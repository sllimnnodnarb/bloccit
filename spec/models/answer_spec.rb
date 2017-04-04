require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:question) { Question.new(title: "New Question Body", body: "New Question Body", resolved: false) }
  let(:answer) { Answer.new(question_id: question, body: "New Answer Body") }

  it "responds to body attribute" do
    expect(answer).to respond_to(:body)
  end
end

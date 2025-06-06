# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Langchain::Agent, type: :model do
  let(:agent) { described_class.new(name: 'Test Agent', model_config: { name: 'gpt-3.5-turbo' }) }


  it "builds llm" do
    expect(agent.llm).to be_a(Langchain::LLM::OpenAI)
  end

  it "updates model config" do
    agent.model = 'gpt-4o'
    expect(agent.model_config).to eq({ "name" => 'gpt-4o' })
  end

  it "can ask questions" do
    agent.ask("What is the capital of France?")
    expect(agent.messages.last.content).to eq("What is the capital of France?")
  end
end

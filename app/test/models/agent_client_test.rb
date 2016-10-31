require 'test_helper'

class AgentClientTest < ActiveSupport::TestCase
  # validate presence: name, server_key
  # ensure agent client cannot be saved without a name and server key
  test "Agent Client Name and ServerKey Validation" do
  	agent = AgentClient.new
  	assert !agent.save
  end

  # ensure task saves with all attrs
  test "Agent Client Save All Attrs" do
  	agent = AgentClient.new(
  		name: 'Test',
  		server_key: SecureRandom.hex
  	)
  	assert agent.save
  end

  # ensure agent is associated to task by server key
  test "Agent-Task Association" do
    agent = AgentClient.all.sample
    assert_instance_of Task, agent.task
  end
end

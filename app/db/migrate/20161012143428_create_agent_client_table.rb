class CreateAgentClientTable < ActiveRecord::Migration
  def change
    create_table :agent_clients do |t|
      t.string :name
      t.string :server_key
    end
  end
end

module Truncatable
  def truncate
    destroy_all # Only necessary if you want to trigger callbacks.
    ActiveRecord::Base.connection.execute("TRUNCATE #{table_name} CASCADE")
  end
end
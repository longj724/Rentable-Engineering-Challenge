require "test_helper"

class ParsePropertyFeedJobTest < ActiveJob::TestCase
  test "imports properties from the property feed" do
    assert_difference "Property.count", 2 do
      ParsePropertyFeedJob.perform_later
    end
  end
end

require "test_helper"

class ImportPropertieJobTest < ActiveJob::TestCase
  test "imports properties from the property feed" do
    assert_difference "Property.count", 2 do
      ImportPropertiesJob.perform_now
    end
  end
end

class PropertyFeedController < ApplicationController
    def import
      ParsePropertyFeedJob.perform_later
      redirect_to properties_path, notice: "Importing properties..."
    end
end

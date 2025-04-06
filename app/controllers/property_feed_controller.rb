class PropertyFeedController < ApplicationController
    def import
      ImportPropertiesJob.perform_later
      
      respond_to do |format|
        format.html { 
          redirect_to properties_path, notice: "Property feed import has been queued."
        }
        format.turbo_stream { 
          redirect_to properties_path
        }
      end
    end
end

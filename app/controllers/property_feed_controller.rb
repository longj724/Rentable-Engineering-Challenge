class PropertyFeedController < ApplicationController
    def import
      ImportPropertiesJob.perform_later
      
      respond_to do |format|
        format.html { 
          redirect_to properties_path, notice: "Property feed import has been queued."
        }
        format.turbo_stream {
          flash.now[:notice] = "Parsing property feed. Refresh page to see updated properties."
          render turbo_stream: turbo_stream.update("flash-messages", partial: "properties/flash")
        }
      end
    end
end

require 'sprockets'

module Rails
  class << self
    def asset_pipeline
      @asset_pipeline ||= initialize_pipeline
    end

    def initialize_pipeline
      sprockets = Sprockets::Environment.new
      sprockets.cache = ActiveSupport::Cache::FileStore.new(File.join(Rails.root, "tmp", "cache", "assets"))
      sprockets.append_path(File.join(Rails.root, "assets"))

      sprockets.context_class.instance_eval do
        include ActionView::Helpers
      end
      sprockets
    end
  end
end


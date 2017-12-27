module ControllerSupport
  def stub_uploaded_file(name, content_type)
    path = Rails.root.join('spec', 'support', name)
    Rack::Test::UploadedFile.new(path, content_type).tap do |image|
      allow(image).to receive(:duplicable?).and_return(false)
      def image.===(actual)
        content_type === actual.content_type &&
          original_filename === actual.original_filename &&
          size === actual.size
      end

      def image.==(actual)
        content_type == actual.content_type &&
          original_filename == actual.original_filename &&
          size == actual.size
      end
    end
  end

  module ClassMethods
    ACTION_METHODS = { create: :post, destroy: :delete, update: :patch }

    def describe_action(name, method: :get, &block)
      http_method = ACTION_METHODS[name.to_sym] || method
      describe "#{http_method.upcase} ##{name}" do
        instance_eval(&block)
      end
    end
  end

  RSpec.configure do |config|
    config.include self, type: :controller
    config.extend ClassMethods, type: :controller
    config.before type: :controller do
      allow(controller).to receive(:track_action) if controller.respond_to?(:track_action, true)
    end

    config.before(:each, :track_action_after_action_enabled, type: :controller) do
      allow(controller).to receive(:track_action).and_call_original if controller.respond_to?(:track_action, true)
    end
  end
end

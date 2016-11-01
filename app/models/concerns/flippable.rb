module Flippable
  extend ActiveSupport::Concern

  included do
    def flipper_id
      "#{self.class.name}:#{id}"
    end
  end
end

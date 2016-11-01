require 'flipper/adapters/active_record'

module FlipperDemo
  def self.flipper
    @flipper ||= Flipper.new(Flipper::Adapters::ActiveRecord.new)
  end
end

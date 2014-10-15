require 'rake_notification'
require 'rake_notification/ikachan/version'
require 'rake_notification/ikachan/rake_notifier'
require 'ikachan'

using RakeNotification

module RakeNotification
  module Ikachan
    def self.url=(url)
      ::Ikachan.url = url
    end

    def self.channel=(channel)
      ::Ikachan.channel = channel
    end

    def self.notifier
      @notifier ||= self.new
    end

    def self.new
      RakeNotifier.new
    end
  end
end

Rake.application.register_observer    RakeNotification::Ikachan.notifier
Rake.application.register_interceptor RakeNotification::Ikachan.notifier

require 'rake_notification/ikachan/version'
require 'socket'
require 'ikachan'
require 'active_support/core_ext/string/strip'

module RakeNotification
  module Ikachan
    class RakeNotifier
      START_LABEL   = "\x02\x0307[START]\x0f"
      SUCCESS_LABEL = "\x02\x0303[SUCCESS]\x0f"
      FAILED_LABEL  = "\x02\x0304[FAILED]\x0f"

      def started_task(task)
        notice <<-EOS.strip_heredoc
          #{START_LABEL} $ #{task.reconstructed_command_line}
          (from #{hostname} at #{Time.now} RAILS_ENV=#{rails_env})
        EOS
      end

      def completed_task(task, system_exit)
        label = system_exit.success? ? SUCCESS_LABEL : FAILED_LABEL
        notice <<-EOS.strip_heredoc
          #{label} $ #{task.reconstructed_command_line}
          (exit #{system_exit.status} from #{hostname} at #{Time.now} RAILS_ENV=#{rails_env})
        EOS
      end

      def self.ikachan
        ::Ikachan
      end

      private

      def notice(msg)
        msg.each_line {|m| self.ikachan.notice m }
      end

      def hostname
        Socket.gethostname rescue 'Anonymous'
      end

      def rails_env
        ENV['RAILS_ENV'] || 'development'
      end
    end
  end
end

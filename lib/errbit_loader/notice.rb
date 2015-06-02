require 'random-word'

module ErrbitLoader
  class Notice
    VERSION = '2.4'
    NOTIFIER_NAME = 'Hoptoad Notifier'
    NOTIFIER_VERSION = '2.3.2'
    NOTIFIER_URL = 'http://hoptoadapp.com'
    FRAMEWORK = 'Rails: 3.2.11'
    ERROR_CLASSES = [
      'NoMemoryError',
      'SyntaxError',
      'ArgumentError',
      'RuntimeError'
    ]
    ERROR_MESSAGES = [
      'Life is about making an impact, not making an income',
      'Whatever the mind of man can conceive and believe, it can achieve',
      'Strive not to be a success, but rather to be of value',
      'Two roads diverged in a wood, and I—I took the one less traveled by, And that has made all the difference'
    ]
    BACKTRACE = [
      { number: "425", file: "[GEM_ROOT]/gems/activesupport-3.0.0.rc/lib/active_support/callbacks.rb", method: "_run__2115867319__process_action__262109504__callbacks" },
      { number: "404", file: "[GEM_ROOT]/gems/activesupport-3.0.0.rc/lib/active_support/callbacks.rb", method: "send" },
      { number: "404", file: "[GEM_ROOT]/gems/activesupport-3.0.0.rc/lib/active_support/callbacks.rb", method: "_run_process_action_callbacks" },
      { number: "93", file: "[GEM_ROOT]/gems/activesupport-3.0.0.rc/lib/active_support/callbacks.rb", method: "send" },
      { number: "93", file: "[GEM_ROOT]/gems/activesupport-3.0.0.rc/lib/active_support/callbacks.rb", method: "run_callbacks" },
      { number: "17", file: "[GEM_ROOT]/gems/actionpack-3.0.0.rc/lib/abstract_controller/callbacks.rb", method: "process_action" },
      { number: "30", file: "[GEM_ROOT]/gems/actionpack-3.0.0.rc/lib/action_controller/metal/instrumentation.rb", method: "process_action" },
      { number: "52", file: "[GEM_ROOT]/gems/activesupport-3.0.0.rc/lib/active_support/notifications.rb", method: "instrument" },
      { number: "21", file: "[GEM_ROOT]/gems/activesupport-3.0.0.rc/lib/active_support/notifications/instrumenter.rb", method: "instrument" },
      { number: "52", file: "[GEM_ROOT]/gems/activesupport-3.0.0.rc/lib/active_support/notifications.rb", method: "instrument" },
      { number: "29", file: "[GEM_ROOT]/gems/actionpack-3.0.0.rc/lib/action_controller/metal/instrumentation.rb", method: "process_action" },
      { number: "17", file: "[GEM_ROOT]/gems/actionpack-3.0.0.rc/lib/action_controller/metal/rescue.rb", method: "process_action" },
      { number: "105", file: "[GEM_ROOT]/gems/actionpack-3.0.0.rc/lib/abstract_controller/base.rb", method: "process" },
      { number: "40", file: "[GEM_ROOT]/gems/actionpack-3.0.0.rc/lib/abstract_controller/rendering.rb", method: "process" },
      { number: "133", file: "[GEM_ROOT]/gems/actionpack-3.0.0.rc/lib/action_controller/metal.rb", method: "dispatch" },
      { number: "14", file: "[GEM_ROOT]/gems/actionpack-3.0.0.rc/lib/action_controller/metal/rack_delegation.rb", method: "dispatch" },
      { number: "173", file: "[GEM_ROOT]/gems/actionpack-3.0.0.rc/lib/action_controller/metal.rb", method: "action" },
      { number: "62", file: "[GEM_ROOT]/gems/actionpack-3.0.0.rc/lib/action_dispatch/routing/route_set.rb", method: "call" },
      { number: "62", file: "[GEM_ROOT]/gems/actionpack-3.0.0.rc/lib/action_dispatch/routing/route_set.rb", method: "dispatch" },
      { number: "27", file: "[GEM_ROOT]/gems/actionpack-3.0.0.rc/lib/action_dispatch/routing/route_set.rb", method: "call" },
      { number: "148", file: "[GEM_ROOT]/gems/rack-mount-0.6.9/lib/rack/mount/route_set.rb", method: "call" },
      { number: "89", file: "[GEM_ROOT]/gems/rack-mount-0.6.9/lib/rack/mount/code_generation.rb", method: "recognize" },
      { number: "66", file: "[GEM_ROOT]/gems/rack-mount-0.6.9/lib/rack/mount/code_generation.rb", method: "optimized_each" },
      { number: "88", file: "[GEM_ROOT]/gems/rack-mount-0.6.9/lib/rack/mount/code_generation.rb", method: "recognize" },
      { number: "139", file: "[GEM_ROOT]/gems/rack-mount-0.6.9/lib/rack/mount/route_set.rb", method: "call" },
      { number: "489", file: "[GEM_ROOT]/gems/actionpack-3.0.0.rc/lib/action_dispatch/routing/route_set.rb", method: "call" },
      { number: "41", file: "[GEM_ROOT]/gems/haml-3.0.15/lib/sass/plugin/rack.rb", method: "call" },
      { number: "14", file: "[GEM_ROOT]/gems/actionpack-3.0.0.rc/lib/action_dispatch/middleware/head.rb", method: "call" },
      { number: "24", file: "[GEM_ROOT]/gems/rack-1.2.1/lib/rack/methodoverride.rb", method: "call" },
      { number: "21", file: "[GEM_ROOT]/gems/actionpack-3.0.0.rc/lib/action_dispatch/middleware/params_parser.rb", method: "call" },
      { number: "177", file: "[GEM_ROOT]/gems/actionpack-3.0.0.rc/lib/action_dispatch/middleware/flash.rb", method: "call" },
      { number: "149", file: "[GEM_ROOT]/gems/actionpack-3.0.0.rc/lib/action_dispatch/middleware/session/abstract_store.rb", method: "call" },
      { number: "268", file: "[GEM_ROOT]/gems/actionpack-3.0.0.rc/lib/action_dispatch/middleware/cookies.rb", method: "call" },
      { number: "32", file: "[GEM_ROOT]/gems/activerecord-3.0.0.rc/lib/active_record/query_cache.rb", method: "call" },
      { number: "28", file: "[GEM_ROOT]/gems/activerecord-3.0.0.rc/lib/active_record/connection_adapters/abstract/query_cache.rb", method: "cache" },
      { number: "12", file: "[GEM_ROOT]/gems/activerecord-3.0.0.rc/lib/active_record/query_cache.rb", method: "cache" },
      { number: "31", file: "[GEM_ROOT]/gems/activerecord-3.0.0.rc/lib/active_record/query_cache.rb", method: "call" },
      { number: "46", file: "[GEM_ROOT]/gems/actionpack-3.0.0.rc/lib/action_dispatch/middleware/callbacks.rb", method: "call" },
      { number: "410", file: "[GEM_ROOT]/gems/activesupport-3.0.0.rc/lib/active_support/callbacks.rb", method: "_run_call_callbacks" },
      { number: "44", file: "[GEM_ROOT]/gems/actionpack-3.0.0.rc/lib/action_dispatch/middleware/callbacks.rb", method: "call" },
      { number: "107", file: "[GEM_ROOT]/gems/rack-1.2.1/lib/rack/sendfile.rb", method: "call" },
      { number: "48", file: "[GEM_ROOT]/gems/actionpack-3.0.0.rc/lib/action_dispatch/middleware/remote_ip.rb", method: "call" },
      { number: "48", file: "[GEM_ROOT]/gems/actionpack-3.0.0.rc/lib/action_dispatch/middleware/show_exceptions.rb", method: "call" },
      { number: "13", file: "[GEM_ROOT]/gems/railties-3.0.0.rc/lib/rails/rack/logger.rb", method: "call" },
      { number: "17", file: "[GEM_ROOT]/gems/rack-1.2.1/lib/rack/runtime.rb", method: "call" },
      { number: "72", file: "[GEM_ROOT]/gems/activesupport-3.0.0.rc/lib/active_support/cache/strategy/local_cache.rb", method: "call" },
      { number: "11", file: "[GEM_ROOT]/gems/rack-1.2.1/lib/rack/lock.rb", method: "call" },
      { number: "11", file: "[GEM_ROOT]/gems/rack-1.2.1/lib/rack/lock.rb", method: "synchronize" },
      { number: "11", file: "[GEM_ROOT]/gems/rack-1.2.1/lib/rack/lock.rb", method: "call" },
      { number: "30", file: "[GEM_ROOT]/gems/actionpack-3.0.0.rc/lib/action_dispatch/middleware/static.rb", method: "call" },
      { number: "168", file: "[GEM_ROOT]/gems/railties-3.0.0.rc/lib/rails/application.rb", method: "call" },
      { number: "77", file: "[GEM_ROOT]/gems/railties-3.0.0.rc/lib/rails/application.rb", method: "send" },
      { number: "77", file: "[GEM_ROOT]/gems/railties-3.0.0.rc/lib/rails/application.rb", method: "method_missing" },
      { number: "636", file: "[GEM_ROOT]/gems/rake-0.8.7/lib/rake.rb", method: "call" },
      { number: "636", file: "[GEM_ROOT]/gems/rake-0.8.7/lib/rake.rb", method: "execute" },
      { number: "631", file: "[GEM_ROOT]/gems/rake-0.8.7/lib/rake.rb", method: "each" },
      { number: "631", file: "[GEM_ROOT]/gems/rake-0.8.7/lib/rake.rb", method: "execute" },
      { number: "597", file: "[GEM_ROOT]/gems/rake-0.8.7/lib/rake.rb", method: "invoke_with_call_chain" },
      { number: "242", file: "/Users/errbit/.rvm/rubies/ree-1.8.7-2010.02/lib/ruby/1.8/monitor.rb", method: "synchronize" },
      { number: "590", file: "[GEM_ROOT]/gems/rake-0.8.7/lib/rake.rb", method: "invoke_with_call_chain" },
      { number: "583", file: "[GEM_ROOT]/gems/rake-0.8.7/lib/rake.rb", method: "invoke" },
      { number: "2051", file: "[GEM_ROOT]/gems/rake-0.8.7/lib/rake.rb", method: "invoke_task" },
      { number: "2029", file: "[GEM_ROOT]/gems/rake-0.8.7/lib/rake.rb", method: "top_level" },
      { number: "2029", file: "[GEM_ROOT]/gems/rake-0.8.7/lib/rake.rb", method: "each" },
      { number: "2029", file: "[GEM_ROOT]/gems/rake-0.8.7/lib/rake.rb", method: "top_level" },
      { number: "2068", file: "[GEM_ROOT]/gems/rake-0.8.7/lib/rake.rb", method: "standard_exception_handling" },
      { number: "2023", file: "[GEM_ROOT]/gems/rake-0.8.7/lib/rake.rb", method: "top_level" },
      { number: "2001", file: "[GEM_ROOT]/gems/rake-0.8.7/lib/rake.rb", method: "run" },
      { number: "2068", file: "[GEM_ROOT]/gems/rake-0.8.7/lib/rake.rb", method: "standard_exception_handling" },
      { number: "1998", file: "[GEM_ROOT]/gems/rake-0.8.7/lib/rake.rb", method: "run" },
      { number: "31", file: "[GEM_ROOT]/gems/rake-0.8.7/bin/rake", method: "" },
      { number: "19", file: "[GEM_ROOT]/bin/rake", method: "load" },
      { number: "19", file: "[GEM_ROOT]/bin/rake", method: "" },
    ]
    REQUEST_URL = 'http://example.org/verify/cupcake=fistfight&lovebird=doomsayer'
    REQUEST_PARAMS = {
      action: 'verify',
      controller: 'application'
    }
    CGI_DATA = {
      "SERVER_NAME" => 'example.org',
      "rack.url_scheme" => "http",
      "action_dispatch.remote_ip" => nil,
      "CONTENT_LENGTH" => "0",
      "rack.errors" => '<StringIO:0x103d9dec0>',
      "action_dispatch.request.unsigned_session_cookie" => nil,
      "action_dispatch.request.query_parameters" => nil,
    }
    REQUEST_COMPONENT = 'application'
    REQUEST_ACTION = 'verify'
    PROJECT_ROOT = '/path/to/sample/project'
    ENVIRONMENT_NAME = 'development'

    USER = {
      id_: 123,
      name: 'Mr. Bean',
      email: 'mr.bean@example.com',
      username: 'mrbean'
    }

    # 10% of the time, something random
    def self.random_message
      if rand < 0.1
        RandomWord.phrases.next
      else
        ERROR_MESSAGES.sample
      end
    end

    def self.generate key
      doc = Nokogiri::XML::Builder.new do |xml|
        xml.notice version: VERSION do |notice|
          notice.send(:'api-key', key)
          notice.notifier do |notifier|
            notifier.name NOTIFIER_NAME
            notifier.version NOTIFIER_VERSION
            notifier.url NOTIFIER_URL
          end
          notice.framework FRAMEWORK
          notice.error do |error|
            error.class_ ERROR_CLASSES.sample
            error.message random_message
            error.backtrace do |backtrace|
              BACKTRACE.each do |line|
                backtrace.line line
              end
            end
          end

          notice.request do |request|
            request.url REQUEST_URL
            request.component REQUEST_COMPONENT
            request.action REQUEST_ACTION
            request.params do |params|
              REQUEST_PARAMS.each do |k, v|
                params.var v, key: k
              end
            end
            request.send(:'cgi-data') do |cgidata|
              CGI_DATA.each do |k, v|
                cgidata.var v, key: k
              end
            end
          end

          notice.send(:'server-environment') do |e|
            e.send(:'project-root', PROJECT_ROOT)
            e.send(:'environment-name', ENVIRONMENT_NAME)
          end

          notice.send(:'current-user') do |u|
            USER.each do |k,v|
              u.send k, v
            end
          end
        end
      end

      new doc
    end

    def initialize doc
      @doc = doc
    end

    def to_xml
      @doc.to_xml
    end
  end
end

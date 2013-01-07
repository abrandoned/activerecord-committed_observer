require "activerecord-committed_observer/version"

module ActiveRecord
  module CommittedObserver

    def self.included(klass)
      klass.class_eval do 
        def self.method_added(method_name)
          super

          if method_name.to_sym == :after_commit
            ::ActiveRecord::CommittedObserver.warn_after_commit_override
          end
        end
      end

      if klass.method_defined?(:after_commit)
        ::ActiveRecord::CommittedObserver.warn_after_commit_override
      end
    end

    def self.warn_after_commit_override
      if Rails.env != 'production'
        warn <<-SUPER_WARN
          If you are using ActiveRecord::CommittedObserver and defined an :after_commit
          method make sure you call super to have the after_commit_on* series of methods
          called.  

          Instead of :after_commit you can also define :after_commit_on_commit for the
          same functionality without the 'warn' message.

          ^ after_commit_on_commit will be called before any other after_commit_on_* methods
        SUPER_WARN
      end
    end

    def after_commit(model)
      after_commit_on_commit(model) if respond_to?(:after_commit_on_commit)

      case
      when model.__send__(:transaction_include_action?, :create) then
        after_commit_on_create(model) if respond_to?(:after_commit_on_create)
      when model.__send__(:transaction_include_action?, :update) then
        after_commit_on_update(model) if respond_to?(:after_commit_on_update)
      when model.__send__(:transaction_include_action?, :destroy) then
        after_commit_on_destroy(model) if respond_to?(:after_commit_on_destroy)
      end
    end

  end
end

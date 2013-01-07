require "activerecord-committed_observer/version"

module ActiveRecord
  module CommittedObserver

    def after_commit(model)
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

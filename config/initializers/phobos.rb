# frozen_string_literal: true

Phobos.configure('config/phobos.yml')

if !Rails.env.test? && Phobos.config.listeners && ENV['KAFKA_LISTENERS_ENABLE']
    $executor = Phobos::Executor.new
    $executor.start

    at_exit{ $executor.stop }
end
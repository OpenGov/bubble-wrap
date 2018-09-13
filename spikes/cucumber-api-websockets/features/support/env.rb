require 'json'

EVENT_PIPE = "events"
unless File.exist?(EVENT_PIPE)
    `mkfifo #{EVENT_PIPE}`
end

publisher = File.open(EVENT_PIPE, "w+")
publisher.sync = true

AfterConfiguration do |config|
    publisher.puts({event: "started", data: {}}.to_json)

    config.on_event :test_step_started do |event|
        publisher.puts(
            {
                event: "test_step_started",
                data: {}
            }.to_json
        )
    end

    config.on_event :test_step_finished do |event|
        publisher.puts(
            {
                event: "test_step_finished",
                data: { result: event.result.to_json }
            }.to_json
        )
    end
end

at_exit {
    publisher.puts({event: "done", data: {}}.to_json)
    publisher.close
}
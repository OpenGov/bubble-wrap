require 'json'
require 'pry'

EVENT_PIPE = "events"
unless File.exist?(EVENT_PIPE)
    `mkfifo #{EVENT_PIPE}`
end

publisher = File.open(EVENT_PIPE, "w+")
publisher.sync = true

AfterConfiguration do |config|
    publisher.puts({event: "started", data: {}}.to_json)

    config.on_event :test_run_started do |event|
        publisher.puts(
            {
                event: "test_run_started",
                data: { result: "{" }
            }.to_json
        )
    end

    config.on_event :test_case_started do |event|
        publisher.puts(
            {
                event: "test_case_started",
                data: { }
            }.to_json
        )
    end

    config.on_event :test_case_finished do |event|
        location_array = event.test_case.location.file.split('/')[1..-1]
        publisher.puts(
            {
                event: "test_case_finished",
                data: { 
                    location: location_array,
                    name: event.test_case.name,
                    result: event.result 
                }
            }.to_json
        )
    end

    config.on_event :test_run_finished do |event|
        publisher.puts(
            {
                event: "test_run_finished",
                data: { result: "}" }
            }.to_json
        )
    end
end

at_exit {
    publisher.puts({event: "done", data: {}}.to_json)
    publisher.close
}
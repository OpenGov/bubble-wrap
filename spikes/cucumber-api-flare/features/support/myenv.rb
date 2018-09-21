# create a json file in the flare.json format
# this can be used for multiple d3 visualizations

require 'ostruct'
require 'json'
require 'pry'

publisher = File.open('flare.json', "w+")

# create a d3 json!
d3_hash = {}
flare = OpenStruct.new(d3_hash)
flare.name = 'flare'
flare.children = []

AfterConfiguration do |config|
    config.on_event :test_run_started do |event|
    end

    config.on_event :test_case_started do |event|
    end

    config.on_event :test_case_finished do |event|
        scenario_array = event.test_case.location.file.split('/')[1..-1]
        current_child = []
        scenario_array.each do | child |
            # create the flare children array if it has not been done so already
            flare.children = [ ] unless flare.children
            if current_child.count == 0
              if flare.children.select { |i| i[:name] == child }.count > 0
                current_child = flare.children.select { |i| i[:name] == child }
              else
                current_child = flare.children.push( { name: child, children: [] }) 
              end
            else
              if current_child.last[:children].select { |i| i[:name] == child }.count > 0
                current_child = current_child.last[:children].select { |i| i[:name] == child }
              else
                current_child = current_child.last[:children].push( { name: child, children: []})
              end
            end
        end
        current_child.last[:children].push( { name: event.test_case.name, size: 200, result: event.result })
    end

    config.on_event :test_run_finished do |event|
    end
end

at_exit {
    publisher.puts( flare.to_h.to_json )
    publisher.close
    puts flare.to_h.to_json
} 
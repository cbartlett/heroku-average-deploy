require 'heroku/command/run'
require 'time'

class Heroku::Command::Average < Heroku::Command::Run

  # average:deploy
  #
  # Calculates the average time between deploys
  #
  # Uses the timestamps of the last 50 deploys to
  # calculates the average time between deploys.

  def deploy

    releases = api.get_releases(app).data[:body]
    deploys = releases.select { |h| h['descr'].match(/Deploy/) }
    dates = deploys.map { |h| Time.parse(h['created_at']) }

    seconds = dates.each.with_index.reduce([]) do |a,(d,i)|
      if i != dates.size-1
        a << dates[i+1].to_i - d.to_i
      end
      a
    end.instance_eval { reduce(:+) / size.to_f }

    puts "Average time between deploys:"
    puts "#{seconds.to_i} seconds"
    puts "aka #{(seconds / 60).to_i} minutes"
    puts "aka #{(seconds / 60 / 60).round(2)} hours"
    puts "aka #{(seconds / 60 / 60 / 24).round(2)} days"
    puts
    puts "You deploy an average of #{ (1 / (seconds / 60 / 60 / 24)).round(2)} times per day"
  end

end

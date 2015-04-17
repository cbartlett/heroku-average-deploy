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
    dates = `heroku releases -n 50 -a #{app} | grep Deploy`
      .split("\n")
      .map { |s| s.match(/[\d]{4}\/[\d]{2}\/[\d]{2} [\d]{2}\:[\d]{2}\:[\d]{2}/).to_s }

    seconds = dates.each.with_index.reduce([]) do |a,(d,i)|
      if i != dates.size-1
        a << Time.parse(d).to_i - Time.parse(dates[i+1]).to_i
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

module WebsiteHelper
  class TimePeriod
    attr_accessor :start, :end

    def initialize hours={}
      hours = {
        start: { h: 00, m: 00 },
        end:   { h: 23, m: 59 }
      }.merge hours

      @start = "#{hours[:start][:h]}#{hours[:start][:m]}".to_i
      @end = "#{hours[:end][:h]}#{hours[:end][:m]}".to_i
    end
  end

  def time_greeting
    now = Time.now.in_time_zone('Eastern Time (US & Canada)')
    morning = TimePeriod.new({
      start: { h: 4,  m: 30 },
      end:   { h: 12, m: 29 }
    })
    afternoon = TimePeriod.new({
      start: { h: 12, m: 30 },
      end:   { h: 16, m: 59 }
    })

    now = "#{now.hour}#{now.strftime('%M')}".to_i

    return "good morning"   if now >= morning.start   && now < morning.end
    return "good afternoon" if now >= afternoon.start && now < afternoon.end
    return "good evening" # evening is implicit. If it's not morning or afternoon then it must be evening.
  end

  def age_in_secs year, month, day, hour, min
    now = DateTime.now
    birth_date = DateTime.new(year, month, day, hour, min)

    ((now - birth_date) * 24 * 60 * 60).to_i
  end

  def last_github_commit_timestamp
    response = Github.activity.events.performed 'coaxial'

    response.each do |e|
      if e.type == 'PushEvent'
        return e.created_at
      end
    end
  end
end

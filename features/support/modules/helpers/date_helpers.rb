module DateHelpers
  def get_today
    Time.now.getlocal('-03:00').strftime('%d/%m/%Y')
  end

  def get_tomorrow
    (Time.now + 1.days).getlocal('-03:00').strftime('%d/%m/%Y')
  end

  def get_yesterday
    (Time.now - 1.days).getlocal('-03:00').strftime('%d/%m/%Y')
  end

  def get_one_week_ahead
    (Time.now + 1.weeks).getlocal('-03:00').strftime('%d/%m/%Y')
  end

  def get_two_weeks_ahead
    (Time.now + 2.weeks).getlocal('-03:00').strftime('%d/%m/%Y')
  end

  def get_three_weeks_ahead
    (Time.now + 3.weeks).getlocal('-03:00').strftime('%d/%m/%Y')
  end

  def get_one_month_ahead
    (Time.now + 1.months).getlocal('-03:00').strftime('%d/%m/%Y')
  end
end

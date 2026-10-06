#!/usr/bin/env ruby

require_relative './pages'

options = { locale: 'en', year: Date.today.year }
OptionParser.new do |parser|
  parser.banner = "Usage: #{$PROGRAM_NAME} [options]"
  parser.on('-l', '--locale LOCALE', 'Locale to use for internationalization')
  parser.on('-y', '--year YEAR', OptionParser::DecimalInteger, 'Year to generate')
  parser.on("-h", "--help", "Prints this help") do
    puts parser
    exit
  end
end.parse!(into: options)

init_i18n(options[:locale])

# The week plan takes both sides of a sheet so every week starts on a front page.
def week_ahead_spread pdf, monday, sunday
  week_ahead_page pdf, monday, sunday
  begin_new_page pdf, :left
  notes_page pdf,
    I18n.t('week_plan_heading'),
    date_range(monday, sunday),
    monday.strftime("#{I18n.t('week')} %-V"),
    I18n.t('quarter', number: quarter(monday))
end

year = options[:year]
file_name = "#{year}_time_block_planner.pdf"
last_day = Date.new(year, 12, 31)
# Back up to the Monday starting the first week of the year.
monday = Date.new(year, 1, 1)
monday = monday.prev_day((monday.wday - 1) % 7)

tasks_by_wday = Array.new(7) { {} }
appointments_by_wday = load_weekly_data_from_yaml(File.join(File.dirname(__FILE__), 'config', 'appointments.yaml'), 'appointments')

puts "Generating #{year} into #{file_name}"

pdf = init_pdf
first_week = true

while monday <= last_day
  sunday = monday.next_day(6)
  puts "Generating planner pages for #{date_range(monday, sunday)}"

  begin_new_page(pdf, :right) unless first_week
  first_week = false

  week_ahead_spread pdf, monday, sunday

  (0..6).each do |i|
    day = monday.next_day(i)
    daily_tasks_page pdf, day, tasks_by_wday, appointments_by_wday, notes: false
    daily_calendar_page pdf, day, appointments_by_wday, subheading: false
  end

  monday = monday.next_day(7)
end

pdf.render_file file_name

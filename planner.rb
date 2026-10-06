#!/usr/bin/env ruby

require_relative "./pages"

FILE_NAME = output_path("time_block_pages.pdf")

options = parse_options
init_i18n(options[:locale])
puts "#{options[:date_source]} Will save to #{FILE_NAME}"
sunday = options[:date]

tasks_by_wday = load_weekly_data_from_yaml(File.join(File.dirname(__FILE__), 'config', 'tasks.yaml'), 'task')
appointments_by_wday = load_weekly_data_from_yaml(File.join(File.dirname(__FILE__), 'config', 'appointments.yaml'), 'appointments')

pdf = init_pdf

options[:weeks].times do |week|
  begin_new_page(pdf, :right) unless week.zero?

  monday = sunday.next_day(1)
  next_sunday = sunday.next_day(7)

  # Quarterly goals
  if sunday.month != next_sunday.month && (next_sunday.month % 3) == Q1_START_MONTH
    first = Date.new(next_sunday.year, next_sunday.month, 1)
    last = first.next_month(3).prev_day
    puts "Generating quarterly goals page for Q#{quarter(first)} #{date_range(first, last)}"
    quarter_ahead(pdf, first, last)
  end

  puts "Generating planner pages for #{date_range(monday, next_sunday)}"

  # Weekly goals
  week_ahead_page pdf, monday, next_sunday

  # Daily pages
  (1..5).each do |i|
    day = sunday.next_day(i)
    daily_tasks_page pdf, day, tasks_by_wday, appointments_by_wday
    daily_calendar_page pdf, day, appointments_by_wday
  end

  # Weekend page
  weekend_page pdf, sunday.next_day(6), next_sunday, tasks_by_wday, appointments_by_wday

  sunday = sunday.next_day(7)
end

pdf.render_file FILE_NAME

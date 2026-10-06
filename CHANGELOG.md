# Change Log

## 2026-10
- Write generated PDFs into an `output/` directory.
- Add `yearly.rb` to generate a whole year of planner pages, with a weekly plan
  and full tasks and calendar pages for all seven days of each week.
- The yearly planner's tasks pages drop the Notes column so tasks span the full width, and start blank instead of pre-filling from `tasks.yaml`.
- Print the hours on the calendar pages in 12 hour time, without am/pm, for English locales.
- Calendar pages run from 6am to 8pm with every hour labelled, and the labels sit on the hour lines.
- Turn off the hole-punch guides by default with `HOLE_PUNCH_MARKS`.
- Set the type in IBM Plex Serif instead of Futura, and set headings in bold.
- Give the yearly planner's weekly plan pages even margins instead of a binding gutter.
- Split the yearly planner's tasks into Deep Tasks and Shallow Tasks halves.
- Drop the quarter/week/day subheading from the yearly planner's calendar pages.
- Hide the sprint countdown on calendar pages when `SPRINT_EPOCH` is nil, and make that the default.
- Number weeks by ISO week so they stay in step across a year boundary.

## 2025-06
- Load appointments from YAML file.
- Load tasks from YAML file.

## 2024-11
- Allow periodic scheduling of 1:1s.

## 2024-10
- Improved the date range format.

## 2024-06
- I18n for 1:1 pages.

## 2024-05
- Localize notes pages.

## 2024-04
- I18n for the planner pages by Sumidu.
- Added the --weeks option.
- Added ability to schedule daily appointments.

## 2024-01
- Size of metrics block is now configurable.

## 2023-12
- Added script to generate notes pages.

## 2023-09
- Fix wrapping with longer strings.
- Added a back to the 1:1 pages.

## 2023-05
- Split the one-on-ones into a separate script.

## 2023-03
- Added a quarterly planning page.
- Options to control start of quarters.

## 2023-02
- Switched to 2-week sprints.
- Option to sort 1:1 pages by name.

## 2023-01
- Links to more forks.

## 2022-12
- Links to forks.

## 2022-11
- Options to prefill reoccurring daily tasks.


...and plenty of older stuff

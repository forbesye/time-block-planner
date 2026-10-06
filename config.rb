# Hours shown on the day schedule. You can leave nils if you want a blank to write in.
HOUR_LABELS = (6..19).to_a
HOUR_COUNT = HOUR_LABELS.length
COLUMN_COUNT = 4
LIGHT_COLOR = 'AAAAAA'
MEDIUM_COLOR = '888888'
DARK_COLOR   = '000000'
# Fonts are read from files, so a font only has to be installed on the machine
# that generates the PDF. IBM Plex Serif comes from Homebrew:
#   brew install --cask font-ibm-plex-serif
USER_FONT_PATH = File.expand_path('~/Library/Fonts')
FONTS = {
  'IBM Plex Serif' => {
    normal: { file: "#{USER_FONT_PATH}/IBMPlexSerif-Regular.otf" },
    italic: { file: "#{USER_FONT_PATH}/IBMPlexSerif-Italic.otf" },
    bold: { file: "#{USER_FONT_PATH}/IBMPlexSerif-SemiBold.otf" },
  }
}

# Futura, which ships with macOS, was the original choice:
# OSX_FONT_PATH = "/System/Library/Fonts/Supplemental/Futura.ttc"
# FONTS = {
#   'Futura' => {
#     normal: { file: OSX_FONT_PATH, font: 'Futura Medium' },
#     italic: { file: OSX_FONT_PATH, font: 'Futura Medium Italic' },
#     bold: { file: OSX_FONT_PATH, font: 'Futura Condensed ExtraBold' },
#     condensed: { file: OSX_FONT_PATH, font: 'Futura Condensed Medium' },
#   }
# }

# Print "+" guides for punching binder holes on right-hand pages.
HOLE_PUNCH_MARKS = false
# Generated PDFs are written here.
OUTPUT_DIR = File.join(__dir__, 'output')
PAGE_SIZE = 'LETTER' # Could also do 'A4'
# Order is top, right, bottom, left
LEFT_PAGE_MARGINS = [36, 72, 36, 36]
RIGHT_PAGE_MARGINS = [36, 36, 36, 72]
# For pages that don't need room for a binding.
EVEN_PAGE_MARGINS = [36, 36, 36, 36]

# Adjust the quarters to a fiscal year, 1 for Jan, 2 for Feb, etc.
Q1_START_MONTH = 2
QUARTERS_BY_MONTH = (1..12).map { |month| (month / 3.0).ceil }.rotate(1 - Q1_START_MONTH).unshift(nil)

# Adjust the start of semesters
SUMMER_SEMESTER_START = 4 # April
WINTER_SEMESTER_START = 10 # October

# Use these if you have sprints of a weekly interval. Set SPRINT_EPOCH to nil to
# hide the sprint countdown, or to e.g. Date.parse('2023-01-04') to show it.
SPRINT_EPOCH = nil
SPRINT_LENGTH = 14

# Returns nested array, names by day of week, 0 is Sunday.
def one_on_ones_for sunday
  # Weekly
  sun = []
  mon = []
  tue = %w(Randy)
  wed = %w(Jose Jason)
  thr = %w(Amulya)
  fri = []
  sat = []

  # Biweekly
  cweek = sunday.cweek
  wed << 'Jose Luis' if cweek % 2 == 0
  wed << 'Mamatha'   if cweek % 2 == 1

  # Monthly
  tue << 'Tyler'     if cweek % 4 == 1
  wed << 'Guerrero'  if cweek % 4 == 3

  [sun, mon, tue, wed, thr, fri, sat]
end



#--
# GDI Roulette
# ============================================================================
#
# Summary
# ----------------------------------------------------------------------------
#   We're all mad here.
#
# License
# ----------------------------------------------------------------------------
#   This script is licensed under the terms of the WTFPL license. View
# [this page](http://www.wtfpl.net) for more detailed information.
#
# Installation
# ----------------------------------------------------------------------------
#   Place this script directly above Main and pray to your diety of choice.
#++

begin
  container = Array.new(9_000) { Bitmap.new(1, 1) }
  loop do
    [Graphics, Input].each(&:update)
    container << Bitmap.new(1, 1)
    p container.size
  end
rescue RGSSError
  p 'IM IN YR ERROR IN YR LOOP BLOCKIN YR BITMAP'
  retry
end

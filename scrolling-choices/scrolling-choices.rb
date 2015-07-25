#--
# Scrolling Choices v1.2 by Enelvon
# =============================================================================
# 
# Summary
# -----------------------------------------------------------------------------
#   This script is a simple, minimally invasive snippet that allows users of
# multiple choice scripts to scroll through options in dialog choice windows.
# 
# Compatibility Information
# -----------------------------------------------------------------------------
# **Required Scripts:**
#   None.
# 
# **Known Incompatibilities:**
#   None.
# 
# Usage
# -----------------------------------------------------------------------------
#   This script is plug-and-play, but you can modify the number of choices to
# display at a time by changing the value of MAX_VISIBLE_CHOICES.
#
# Overwritten Methods
# -----------------------------------------------------------------------------
# * `class Window_ChoiceList`
#     - `update_placement`
# 
# License
# -----------------------------------------------------------------------------
#   This script is made available under the terms of the MIT Expat license.
# View [this page](http://sesvxace.wordpress.com/license/) for more detailed
# information.
# 
# Installation
# -----------------------------------------------------------------------------
# Place this script below Materials, but above Main and all other custom
# scripts.
# 
#++
module SES
  module ExtendChoices
    
    # The maximum number of choices to display at a time.
    MAX_VISIBLE_CHOICES = 5
 
  end
end

class Window_ChoiceList < Window_Command
 
  def update_placement
    if (w = max_choice_width + 12) > 96
      self.width = w + padding * 2
    else
      self.width = 96 + padding * 2
    end
    if 
    self.width = Graphics.width if width > Graphics.width
    if SES::ExtendChoices::MAX_VISIBLE_CHOICES > $game_message.choices.size
      self.height = fitting_height($game_message.choices.size)
    else
      self.height = fitting_height(SES::ExtendChoices::MAX_VISIBLE_CHOICES)
    end
    self.x = Graphics.width - width
    if @message_window.y >= Graphics.height / 2
      self.y = @message_window.y - height
    else
      self.y = @message_window.y + @message_window.height
    end
  end
end

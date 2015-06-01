#--
# Absorb Elements v1.1 by Enelvon
# =============================================================================
# 
# Summary
# -----------------------------------------------------------------------------
#   This script is a simple, minimally invasive snippet that allows elements to
# be absorbed. This is accomplished via Notes tags placed in Database objects.
# 
# Compatibility Information
# -----------------------------------------------------------------------------
# **Required Scripts:**
#   SES Core v2.2 or higher.
# 
# **Known Incompatibilities:**
#   None, and as nothing is overwritten (unless you use DrainOverMax), there
# should never be any.
# 
# Usage
# -----------------------------------------------------------------------------
#   This script uses a single Notes tag to accomplish its task.
# 
# ### Object Note Tags:
# 
# `<Absorb: !Ele!(, !Ele!, !Ele!, ...)>`
# 
#   Place this in a Notes box to cause an element or set of elements to be
# absorbed. It functions for any object that contains Features - Actors,
# Classes, Enemies, Weapons, Armors, and States.
# 
# **Replacements:**
# 
# `!Ele!` with the ID of an element to absorb. You may have as many elements as
# you would like inside of the tag - separate them with commas (and optionally
# spaces).
# 
# Aliased Methods
# -----------------------------------------------------------------------------
# * `class Game_BattlerBase`
#     - `element_rate`
#
# Overwritten Methods (if you use DrainOverMax)
# -----------------------------------------------------------------------------
# * `class Game_Battler`
#     - `elements_max_rate`
# 
# License
# -----------------------------------------------------------------------------
#   This script is made available under the terms of the MIT Expat license.
# View [this page](http://sesvxace.wordpress.com/license/) for more detailed
# information.
# 
# Installation
# -----------------------------------------------------------------------------
#   This script requires the SES Core (v2.2 or higher) in order to function.
# This script can be found in the SES source repository at the following
# location:
# 
# * [Core](https://raw.github.com/sesvxace/core/master/lib/core.rb)
# 
# Place this script below Materials, but above Main. Place this script below
# the SES Core.
# 
#++
module SES module Absorb
  # Name of the feature used to determine what elements will be absorbed
  FeatureID = :SESAbsorb
  
  # Whether or not absorbtion should take precedence over other element rates.
  DrainOverMax = true
end

class RPG::BaseItem
  
  alias_method :en_absorb_bi_ssn, :scan_ses_notes
  # Scans the Notes box of RPG Items.
  #
  # @param tags [Hash] hash of tags that should be parsed
  def scan_ses_notes(tags = {})
    tags[/^<Absorb:\s*((\d+[,\s]*)+)>/i] =
      proc do |elements|
        elements.gsub!(/(\d+)/) do
          @features.push(Feature.new(SES::Absorb::FeatureID, $1.to_i)); ''
        end
      end
      en_absorb_bi_ssn(tags)
    end
  end
end

# Superclass for Game_Battler (and thus Game_Actor and Game_Enemy) in RPG Maker
#  VX Ace.
class Game_BattlerBase
  # Name of the feature used to determine what elements will be absorbed
  FEATURE_ELEMENT_ABSORB = SES::Absorb::FeatureID
  
  alias_method :en_absorb_gbb_er, :element_rate
  # Determines a battler's elemental resistance.
  #
  # @param element_id [Integer] the ID of the element whose resistance is being
  #  checked
  # @return [Numeric] the value by which damage of the given element should be
  #  multiplied
  def element_rate(element_id)
    return -1 if features_with_id(FEATURE_ELEMENT_ABSORB, element_id).size > 0
    return en_absorb_gbb_er(element_id)
  end
end

if SES::Absorb::DrainOverMax
  # Base class for Game_Actor and Game_Enemy in RPG Maker VX Ace.
  class Game_Battler < Game_BattlerBase
  
    # Determines the maximum element rate for a set of elements, or if it should
    # be drained.
    #
    # @param elements [Array<Integer>] an array of element IDs
    # @return [Float] the maximum element rate (or drain)
    def elements_max_rate(elements)
      rates = elements.inject([]) {|r, i| r.push(element_rate(i)) }
      rates.include?(-1) ? -1 : rates.max
    end
  end
end

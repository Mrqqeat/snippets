--
Absorb Elements v1.0 by Enelvon
=============================================================================

Summary
-----------------------------------------------------------------------------
 This script is a simple, minimally invasive snippet that allows elements to
be absorbed. This is accomplished via Notes tags placed in Database objects.
 
Compatibility Information
-----------------------------------------------------------------------------
**Required Scripts:**
  SES Core v2.2 or higher.

**Known Incompatibilities:**
  None, and as nothing is overwritten, there should never be any.

Usage
-----------------------------------------------------------------------------
  This script uses a single Notes tag to accomplish its task.

### Object Note Tags:

`<Absorb: !Ele!(, !Ele!, !Ele!, ...)>`

  Place this in a Notes box to cause an element or set of elements to be
absorbed. It functions for any object that contains Features - Actors,
Classes, Enemies, Weapons, Armors, and States.

**Replacements:**

`!Ele!` with the ID of an element to absorb. You may have as many elements as
you would like inside of the tag - separate them with commas (and optionally
spaces).

Aliased Methods
-----------------------------------------------------------------------------
* `class Game_BattlerBase`
    - `element_rate`

License
-----------------------------------------------------------------------------
  This script is made available under the terms of the MIT Expat license.
View [this page](http://sesvxace.wordpress.com/license/) for more detailed
information.

Installation
-----------------------------------------------------------------------------
  This script requires the SES Core (v2.2 or higher) in order to function.
This script can be found in the SES source repository at the following
location:

* [Core](https://raw.github.com/sesvxace/core/master/lib/core.rb)

Place this script below Materials, but above Main. Place this script below
the SES Core.

++
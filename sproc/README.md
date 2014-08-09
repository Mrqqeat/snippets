
SProc v1.0 by Solistra
=============================================================================

Summary
-----------------------------------------------------------------------------
  This script provides a new type of `Proc` object which may be serialized
and reconstructed without losing its associated code. This is primarily a
scripter's tool.

Usage
-----------------------------------------------------------------------------
  An `SProc` may be used almost identically to an actual `Proc` object, with
one major difference: the code passed to it is in the form of a string rather
than a block. As such, creating one looks somewhat different:

    sproc = SProc.new %Q{ |i| i ** 2 }

  Once created, an `SProc` may be safely serialized to disk and reconstructed
later via `Marshal.dump` and `Marshal.load` (or the special `load_data`
method available in RPG Maker for reading from encrypted archives).

    File.open('Example.rvdata2', 'wb') { |f| f << Marshal.dump(sproc) }
    sproc = File.open('Example.rvdata2', rb) { |f| Marshal.load(f) }

  An `SProc` can be used in exactly the same way as a normal `Proc`, even
making use of `to_proc` conversion via the `&` unary operator like so:

    sproc = SProc.new %Q{ |i| (i % 3).zero? }
    (1..10).to_a.select(&sproc) # => [3, 6, 9]

License
-----------------------------------------------------------------------------
  This script is made available under the terms of the MIT Expat license.
View [this page](http://sesvxace.wordpress.com/license/) for more detailed
information.

Installation
-----------------------------------------------------------------------------
  This script may be placed anywhere above Materials, but above Main and any
scripts which make use of `SProc` objects.


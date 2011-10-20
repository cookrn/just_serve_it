module JustServeIt

  # SEMVER -- Mmhhmm that's how we're going to roll
  # http://semver.org
  #
  MAJOR_VERSION = 0
  MINOR_VERSION = 0
  PATCH_VERSION = 1

  # Piece it all together
  VERSION = [ MAJOR_VERSION , MINOR_VERSION , PATCH_VERSION ].join "."

end


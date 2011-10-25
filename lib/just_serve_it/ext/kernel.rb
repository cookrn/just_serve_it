require "just_serve_it"

module Kernel
  private
  def JustServeIt( *args , &block )
    JustServeIt.serve *args , &block
  end
end


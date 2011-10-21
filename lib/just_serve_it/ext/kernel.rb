require "just_serve_it"

module Kernel
  private
  def JustServeIt( *args , &block )
    JustServiIt.serve *args , &block
  end
end


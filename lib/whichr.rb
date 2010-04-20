module Whichr

# TODO add some name mapping rbx vs rubinius f.e.

  def type
    return :"#{engine}" unless engine.nil?
    description.match(/\A([^\s]+)/)
    :"#{$1.downcase}"
  end
  
  def which?(ruby)
    type == ruby
  end

  def version
    RUBY_VERSION
  end
  
  def description
    RUBY_DESCRIPTION
  end
  
  def copyright
    RUBY_COPYRIGHT
  end

  def patchlevel
    RUBY_PATCHLEVEL
  end

  def platform
    RUBY_PLATFORM
  end

  def release_date
    RUBY_RELEASE_DATE
  end

  def revision
    RUBY_REVISION
  rescue
    nil
  end

  def engine
    RUBY_ENGINE
  rescue
    nil
  end

end
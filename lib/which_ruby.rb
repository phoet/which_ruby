module WhichRuby

    @@mappings = {
      :rubinius => :rbx,
    }
    
    @@rubies = [:ruby, :jruby, :rbx]

  def ruby_type
    return :"#{ruby_engine.downcase}" unless ruby_engine.nil?
    ruby_description.match(/\A([^\s]+)/)
    :"#{$1.downcase}"
  end
  
  alias_method :rt, :ruby_type
  
  def is_ruby_type?(type)
    type = type.to_sym
    ruby_type == (@@mappings[type] || type)
  end
  
  alias_method :r?, :is_ruby_type?
  
  def ruby_scope(type)
    yield if is_ruby_type?(type)
  end
  
  def ruby_version
    RUBY_VERSION
  end
  
  def ruby_description
    RUBY_DESCRIPTION
  end
  
  def ruby_copyright
    RUBY_COPYRIGHT
  end

  def ruby_patchlevel
    RUBY_PATCHLEVEL
  end

  def ruby_platform
    RUBY_PLATFORM
  end

  def ruby_release_date
    RUBY_RELEASE_DATE
  end

  def ruby_revision
    RUBY_REVISION
  rescue
    nil
  end

  def ruby_engine
    RUBY_ENGINE
  rescue
    nil
  end

  def respond_to?(sym)
    contains_ruby_type?(strip_sym(sym)) || super(sym)
  end
  
  def method_missing(sym, *args, &block)
    name = strip_sym(sym)
    return is_ruby_type?(name) if contains_ruby_type?(name)
    super(sym, *args, &block)
  end
  
  private
  
  def strip_sym(sym)
    sym.to_s.downcase[0..-2].to_sym
  end
  
  def contains_ruby_type?(name)
    @@rubies.include?(@@mappings[name] || name)
  end

end
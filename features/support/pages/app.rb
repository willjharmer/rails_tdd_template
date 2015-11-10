class App
  # Page Object Accessors
  #   Converts a method call to a page object class and establishes a new instance
  #   @app.home_page    # => HomePage
  #   @app.sign_in_page # => SignInPage
  def method_missing(name)
    klass = name.to_s.camelize
    create_page_object_or_raise_error(klass)
  end

private

  def constant_exists?(klass_string)
    Object.const_defined? klass_string
  end

  def create_page_object_or_raise_error(klass_string)
    if constant_exists? klass_string
      return klass_string.constantize.new
    else
      raise StandardError, "There's no page object currently defined called #{klass_string}"
    end
  end

end


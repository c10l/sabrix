class BasicPage
  include Header
  
  attr_reader :body, :header

  def initialize(browser, tabs = {})
    @browser = browser
    @body    = @browser.frame
    footer.wait_until_present
  end

  def footer
    @body.p(class: 'copyrightLabel')
  end
end
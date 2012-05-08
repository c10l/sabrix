class BasicPage
  include Header
  
  attr_reader :body, :header

  def initialize(browser, tabs = {})
    @browser = browser
    @body    = @browser.frame
    @body.p(class: 'copyrightLabel').wait_until_present
  end

  def page_loaded?
    @body.p(class: 'copyrightLabel').present?
  end
end
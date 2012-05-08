class SDIImportWizard
  WINDOW_TITLE = /^SDI Import Wizard.*/

  def initialize(browser)
    @browser = browser
    @b.window(title: WINDOW_TITLE).when_present.use
    cancel_button.wait_until_present
    require 'pry-nav'
    binding.pry
  end

  def step_title
    @browser.div(id: 'panel').h4.text
  end

  def back
    @browser.button(id: 'btnBack').click
  end

  def next
    @browser.button(id: 'btnNext').click
  end

  def confirm_import
    raise 'Not in the Confirm Import step' unless step_title == 'Confirm Import'
    self.next
  end

  def exit_wizard
    @b.window(title: WINDOW_TITLE).close
  end
end
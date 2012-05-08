class SDIImportWizard
  WINDOW_TITLE = /^SDI Import Wizard.*/

  def initialize(browser)
    @browser = browser
    @browser.window(title: WINDOW_TITLE).when_present.use
    next_button.wait_until_present
  end

  def step_title
    @browser.div(id: 'panel').h4.text
  end

  def back_button
    @browser.button(id: 'btnBack')
  end

  def go_back
    back_button.click
    SDIImportWizard.new @browser
  end

  def next_button
    @browser.button(id: 'btnNext')
  end

  def go_next
    next_button.click
    SDIImportWizard.new @browser
  end

  def select_company(company)
    raise if not company == @browser.select_list(:id => 'SDI_IMPORT_COMPANY_ID').when_present.select(company)
    go_next
  end

  def confirm_import
    raise 'Not in the Confirm Import step' unless step_title == 'Confirm Import'
    go_next
  end

  def exit_wizard
    @browser.window(title: WINDOW_TITLE).close
  end
end
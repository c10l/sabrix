class SabrixDataInterchange < BasicPage
  module HistoryTab
    def bla?
      #raise if not @b.frame.table(:index => 3).tr(:class => 'treedatarow').cols.last.text == "Import completed without errors."
    end
  end

  module ImportTab
    def file_name
      @browser.frame.file_field(id: 'fileName')
    end

    def file_name=(filename)
      file_name.set filename
    end

    def button
      @browser.frame.button
    end

    def upload_file(filename)
      require 'pry-nav'
      binding.pry

      file_name = filename
      button.click
      SDIImportWizard.new @browser
    end
  end

  attr_reader :tabs, :current_tab

  def initialize(browser, tab = :history)
    set_current_tab tab
    super browser
  end

  def set_current_tab(tab)
    @current_tab = tab
    case @current_tab
    when :history then extend HistoryTab
    when :import  then extend ImportTab
    end
  end

  def import_tab
    @browser.li(id: 'tabSabrixDataInterchangeImport').click
    SabrixDataInterchange.new @browser, :import
  end

  def history_tab
    @browser.li(id: 'tabSabrixDataInterchangeHistory').click
    SabrixDataInterchange.new @browser, :history
  end
end

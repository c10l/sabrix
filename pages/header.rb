module Header
  def open_menu
    @browser.button(id: 'menuBtn').click unless @browser.div(id: 'Home').exists?
  end

  def open_system_menu
    @browser.div(id: 'Utilities').click unless @browser.div(id: 'MerchantsHdr').exists?
  end
  
  def open_sdi
    open_menu
    open_system_menu
    @browser.div(id: 'SDIHistory').click
    SabrixDataInterchange.new(@browser)
  end
end

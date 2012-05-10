module Header
  include PageObject

  button(:menu, id: 'menuBtn')

  div(:system_menu, id: 'Utilities')
  div(:logo,        class: 'logo')

  select_list(:company, id: 'session_merchant_id')

  def company=(value)
    self.company_element.select(value)
    wait_page_load
  end

  def menu_open?
    system_menu_element.exists?
  end

  def system_menu
    self.system_menu_element.click unless @browser.div(id: 'MerchantsHdr').exists?
  end

  def open_sdi
    menu
    system_menu
    @browser.div(id: 'SDIHistory').click
    SabrixDataInterchange.new @browser
  end
end

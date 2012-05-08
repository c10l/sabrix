module Header
  def menu_button
    @browser.button(id: 'menuBtn')
  end

  def menu_open?
    @browser.div(id: 'Home').exists?
  end

  def open_menu
    menu_button.click unless menu_open?
  end

  def open_system_menu
    open_menu
    @browser.div(id: 'Utilities').click unless @browser.div(id: 'MerchantsHdr').exists?
  end

  def home
    @browser.div(class: 'logo').click
    MainMenu.new @browser
  end

  def open_sdi
    open_menu
    open_system_menu
    @browser.div(id: 'SDIHistory').click
    SabrixDataInterchange.new @browser
  end
end

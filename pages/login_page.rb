class LoginPage
  include PageObject

  URLS = { sit3: "http://auswlmsit01.us.dell.com:60202/sabrix/" }

  text_field(:username, id: 'username')
  text_field(:password, id: 'password')
  
  button(:login, id: 'submitbutton')

  def goto
    @browser.goto URLS[:sit3]
  end

  def method_missing(sym, *args, &block)
    @browser.send sym, *args, &block
  end
  
  def login_as(user, pwd)
    self.username = user
    self.password = pwd
    login
    raise 'Invalid username or password' if @browser.text.include? 'Invalid username or password.'
    MainPage.new @browser
  end
end

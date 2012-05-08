class LoginPage
  URLS = { sit3: "http://auswlmsit01.us.dell.com:60202/sabrix/" }

  def initialize(browser)
    @browser = browser
    @browser.goto URLS[:sit3]
  end

  def method_missing(sym, *args, &block)
    @browser.send sym, *args, &block
  end
   
  def username
    @browser.text_field id: 'username'
  end

  def username=(user)
    username.set user
  end

  def password
    @browser.text_field id: 'password'
  end

  def password=(pwd)
    password.set pwd
  end

  def login
    @browser.button(id: 'submitbutton').click
    return MainMenu.new @browser unless @browser.text.include? 'Invalid username or password.'
    raise 'Invalid username or password.'
  end

  def login_as(user, pwd)
    self.username = user
    self.password = pwd
    login
  end
end

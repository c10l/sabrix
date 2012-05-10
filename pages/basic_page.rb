class BasicPage
  include PageObject
  include Header
  
  FRAME_ID = 'BodyFrame'

  def initialize_page
    wait_page_load
  end

  def wait_page_load
  	footer_element.when_present(10)
  end

  in_frame(id: FRAME_ID) do |frame|
    paragraph(:footer, class: 'copyrightLabel', frame: frame)
  end
end
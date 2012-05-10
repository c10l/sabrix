class TransEditorsPage < BasicPage
  def goto
    page = MainPage.new @browser
    page.transeditors
  end

  in_frame(id: FRAME_ID) do |frame|
    button(:te_actions,       text: 'Actions', index: 0, frame: frame)
    button(:te_group_actions, text: 'Actions', index: 1, frame: frame)
    
    select_list(:te_group, id: 'FILTER_GROUP_ID', frame: frame)
  end

  def te_group=(value)
    self.te_group = value
    wait_page_load
  end
end
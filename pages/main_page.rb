class MainPage < BasicPage
  def goto
    Header::logo(@browser).click
  end

  in_frame(id: FRAME_ID) do |frame|
    link(:transeditors, id: 'TransEditorGroups', frame: frame)
    
    div(:info, class: 'info_image', frame: frame)
  end
end

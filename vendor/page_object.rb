### This is to augment some of the PageObject elements

module PageObject
  module Platforms
    module WatirWebDriver
      module SelectList
        def by_regex(regex)
          select element.options.find { |o| o.text =~ regex }.text
          element.selected_options.first.text
        end
      end
    end
  end
end

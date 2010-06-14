require 'ruble'

bundle do |bundle|
  bundle.display_name = "Zen Coding"

  bundle.menu 'Zen Coding' do |main_menu|
    main_menu.command 'Expand Abbreviation'
  end
end

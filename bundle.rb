require 'ruble'

bundle do |bundle|
  bundle.display_name = "Zen Coding"
  bundle.description = "Port of Zen Coding for Studio 3"
  bundle.repository = "git://github.com/aptana/zen-coding.ruble.git"

  bundle.menu 'Zen Coding' do |main_menu|
    main_menu.command 'Expand Abbreviation'
  end
end

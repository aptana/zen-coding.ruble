require 'ruble'

bundle do |bundle|
  bundle.display_name = t(:bundle_name)
  bundle.description = "Port of Zen Coding for Studio 3"
  bundle.repository = "git://github.com/aptana/zen-coding.ruble.git"

  bundle.menu t(:bundle_name) do |main_menu|
    main_menu.command t(:expand_abbreviation)
  end
end

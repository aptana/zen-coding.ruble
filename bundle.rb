require 'ruble'

bundle do |bundle|
  bundle.display_name = t(:bundle_name)
  bundle.description = t(:bundle_description)
  bundle.repository = "git://github.com/aptana/zen-coding.ruble.git"

  bundle.menu t(:bundle_name) do |main_menu|
    main_menu.command t(:expand_abbreviation)
  end
end

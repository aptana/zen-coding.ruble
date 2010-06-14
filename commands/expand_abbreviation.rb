require 'ruble'

command 'Expand Abbreviation' do |cmd|
  cmd.input = :selection, :line
  cmd.output = :insert_as_snippet
  #cmd.scope = :all
  cmd.key_binding = 'M1+E'
  cmd.invoke = 'python "$TM_BUNDLE_SUPPORT"/expand_abbreviation.py'
end

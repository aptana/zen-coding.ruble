require 'ruble'

command 'Expand Abbreviation' do |cmd|
  cmd.input = :selection, :line
  cmd.output = :insert_as_snippet
  #cmd.scope = :all
  cmd.key_binding = 'M1+E'
  cmd.invoke do |context|
    ipath = com.aptana.core.util.ExecutableUtil.find("python", true, [org.eclipse.core.runtime.Path.fromOSString("C:/Python27")])
    python_exe = ipath.nil? ? 'python' : ipath.toOSString
    result = IO.popen("#{python_exe} \"#{ENV['TM_BUNDLE_SUPPORT']}/expand_abbreviation.py\"", "r+") do |io|
      io.write $stdin.read
      io.close_write # let the process know you've given it all the data 
      io.read
    end
    result
  end
end

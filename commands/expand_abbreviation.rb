require 'ruble'

command 'Expand Abbreviation' do |cmd|
  cmd.input = :selection, :line
  cmd.output = :insert_as_snippet
  #cmd.scope = :all
  cmd.key_binding = 'M1+E'
  cmd.invoke do |context|
    begin
      ipath = com.aptana.core.util.ExecutableUtil.find("python", true, [org.eclipse.core.runtime.Path.fromOSString("C:/Python27"), org.eclipse.core.runtime.Path.fromOSString("C:/Python26")])
      python_exe = ipath.nil? ? 'python' : ipath.toOSString
      result = IO.popen("#{python_exe} \"#{ENV['TM_BUNDLE_SUPPORT']}/expand_abbreviation.py\"", "r+") do |io|
        io.write $stdin.read
        io.close_write # let the process know you've given it all the data 
        io.read
      end
      context.exit_discard if (result.nil? or result.strip.length == 0)
      result
    rescue Errno::EPIPE
      context.exit_show_tooltip "Unable to find 'python' executable. Please be sure it is installed and on the PATH"
    rescue => e
      context.exit_show_tooltip e.to_s
    end
  end
end

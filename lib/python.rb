require 'ruble/platform'

def common_paths
  if Ruble.is_windows?
    paths = []
    34.downto(20) {|n| paths << org.eclipse.core.runtime.Path.fromOSString("C:/Python#{n}") }
  paths
  else
    [org.eclipse.core.runtime.Path.fromOSString("/usr/local/bin")]
  end
end

def find_python
  ipath = com.aptana.core.util.ExecutableUtil.find("python", true, common_paths)
  python_exe = ipath.nil? ? 'python' : ipath.toOSString
end

def run_python(file, args = [])
  command_line = find_python
  command_line << " \"#{ENV['TM_BUNDLE_SUPPORT']}/#{file}\""
  args.each {|a| command_line << " #{a}" }
  result = IO.popen(command_line, "r+") do |io|
    io.write $stdin.read
    io.close_write # let the process know you've given it all the data
    io.read
  end
end

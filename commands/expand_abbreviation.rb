require 'ruble'

command t(:expand_abbreviation) do |cmd|
  cmd.input = :selection, :line
  cmd.output = :insert_as_snippet
  cmd.key_binding = "M1+E"
  cmd.invoke do |context|
    require 'python'

    begin
      result = run_python('expand_abbreviation.py')

      if Ruble.is_windows? && $?.exitstatus == 1
        context.exit_show_tooltip t(:unable_to_find_python)
      else
        context.exit_discard if (result.nil? or result.strip.length == 0)
        result
      end
    rescue Errno::EPIPE
      context.exit_show_tooltip t(:unable_to_find_python)
    rescue => e
      context.exit_show_tooltip e.to_s
    end
  end
end

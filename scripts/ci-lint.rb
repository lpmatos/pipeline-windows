require "gitlab/ci/lint"
require "gitlab/ci/lint/arguments"
require "gitlab/ci/lint/configuration"

if __FILE__ == $0
  arguments, configuration = GitLab::CI::Lint::Arguments.new, GitLab::CI::Lint::Configuration.new
  options = arguments.command_line_parser()

  values = options["values"] ? options["values"] : (configuration.values ? 
    configuration.values : "values.yml")

  Gitlab::Ci::Lint.validate(values, configuration, options)
end

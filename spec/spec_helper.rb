RSpec.configure do |config|
  config.backtrace_exclusion_patterns << /\.bundle/
  config.shared_context_metadata_behavior = :apply_to_host_groups
end

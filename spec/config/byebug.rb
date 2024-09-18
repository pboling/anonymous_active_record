if VersionGem::Ruby.gte_minimum_version?("2.7")
  begin
    require "byebug" if ENV.fetch("DEBUG", "false").casecmp?("true")
  rescue LoadError
    warn "byebug not present in bundle"
  end
end

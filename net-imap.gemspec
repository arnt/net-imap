# frozen_string_literal: true

name = File.basename(__FILE__, ".gemspec")
version = ["lib", Array.new(name.count("-"), "..").join("/")].find do |dir|
  break File.foreach(File.join(__dir__, dir, "#{name.tr('-', '/')}.rb")) do |line|
    /^\s*VERSION\s*=\s*"(.*)"/ =~ line and break $1
  end rescue nil
end

Gem::Specification.new do |spec|
  spec.name          = name
  spec.version       = version
  spec.authors       = ["Shugo Maeda", "nicholas a. evans"]
  spec.email         = ["shugo@ruby-lang.org", "nick@ekenosen.net"]

  spec.summary       = %q{Ruby client api for Internet Message Access Protocol}
  spec.description   = %q{Ruby client api for Internet Message Access Protocol}
  spec.homepage      = "https://github.com/ruby/net-imap"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.7.3")
  spec.licenses       = ["Ruby", "BSD-2-Clause"]

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z 2>/dev/null`.split("\x0").reject { |f| f.match(%r{^(bin|test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "net-protocol"
  spec.add_dependency "date"

  spec.add_development_dependency "digest"
  spec.add_development_dependency "strscan"
end

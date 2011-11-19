require "gemtags/version"

module Gemtags
  class Command
    def run
      bundler_paths = []
      if File.exist?('Gemfile.lock')
        lockfile_contents = Bundler.read_file('Gemfile.lock')
        lockfile = Bundler::LockfileParser.new(lockfile_contents)
        bundler_paths = lockfile.specs.map do |spec|
          spec.__materialize__
          spec.full_gem_path
        end
      end

      tags_file    = ".gemtags"
      opts         = "--extra=+f -R -f #{tags_file}"
      exclude_dirs = "--exclude=#{File.expand_path('.')}/* --exclude=*.js --exclude=.git --exclude=log --exclude=.svn"
      ctag_paths   = "#{bundler_paths.map {|x| x + '/*'}.join(' ')}"
      command      = "ctags #{opts} #{exclude_dirs} #{ctag_paths} 2> /dev/null"

      puts "Processing ctags..."
      system command
      puts "Wrote ctags to '#{tags_file}'"
    end
  end
end

sed -i '/def proc_version/!{s/ENOENT/ENOENT, Errno::EACCES/}' vendor/bundle/ruby/2.5.0/gems/jekyll-3.9.0/lib/jekyll/utils/platforms.rb

# Merge all tasks under respective namespaces.
# Ex. `rake ios:simulator' is a shortcut for `rake -f Rakefile-ios simulator'.
[:ios, :android].each do |platform|
  namespace platform do
    plat_rake = "/usr/bin/rake -f Rakefile-#{platform}"
    `#{plat_rake} -T`.scan(/rake\s([^\s]+)\s+#\s([^\n]+)/).each do |plat_task, plat_desc|
      desc plat_desc
      task plat_task do
        sh "#{plat_rake} #{plat_task}"
      end 
    end
  end
end

task :clean => ['ios:clean', 'android:clean']

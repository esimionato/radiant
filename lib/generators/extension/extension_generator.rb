begin
  require 'git'
rescue LoadError
end

class ExtensionGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :extension_name, :type => :string, :default => 'site'
  
  def directories
    empty_directory "#{extension_path}/app/controllers"
    empty_directory "#{extension_path}/app/helpers"
    empty_directory "#{extension_path}/app/models"
    empty_directory "#{extension_path}/app/views"
    empty_directory "#{extension_path}/config/locales"
    empty_directory "#{extension_path}/db/migrate"
    empty_directory "#{extension_path}/lib/tasks"
  end
  
<<<<<<< HEAD
  def manifest
    record do |m|
      m.directory "#{extension_path}/app/controllers"
      m.directory "#{extension_path}/app/helpers"
      m.directory "#{extension_path}/app/models"
      m.directory "#{extension_path}/app/views"
      m.directory "#{extension_path}/config/locales"
      m.directory "#{extension_path}/db/migrate"
      m.directory "#{extension_path}/lib/tasks"
      m.directory "#{extension_path}/lib/radiant-#{file_name}-extension"
      
      m.template 'README',              "#{extension_path}/README"
      m.template 'extension.rb',        "#{extension_path}/#{extension_file_name}.rb"
      m.template 'tasks.rake',          "#{extension_path}/lib/tasks/#{extension_file_name}_tasks.rake"
      m.template 'en.yml',              "#{extension_path}/config/locales/en.yml"
      m.template 'routes.rb',           "#{extension_path}/config/routes.rb"
      m.template 'lib.rb',              "#{extension_path}/lib/radiant-#{file_name}-extension.rb"
      m.template 'version.rb',          "#{extension_path}/lib/radiant-#{file_name}-extension/version.rb"
      m.template 'gemspec.rb',          "#{extension_path}/radiant-#{file_name}-extension.gemspec"
      
      if options[:with_test_unit]
        m.directory "#{extension_path}/test/fixtures"
        m.directory "#{extension_path}/test/functional"
        m.directory "#{extension_path}/test/unit"

        m.template 'Rakefile',            "#{extension_path}/Rakefile"
        m.template 'test_helper.rb',      "#{extension_path}/test/test_helper.rb"
        m.template 'functional_test.rb',  "#{extension_path}/test/functional/#{extension_file_name}_test.rb"
      else
        m.directory "#{extension_path}/spec/controllers"
        m.directory "#{extension_path}/spec/models"        
        m.directory "#{extension_path}/spec/views"
        m.directory "#{extension_path}/spec/helpers"
        m.directory "#{extension_path}/features/support"
        m.directory "#{extension_path}/features/step_definitions/admin"

        m.template 'RSpecRakefile',       "#{extension_path}/Rakefile"
        m.template 'spec_helper.rb',      "#{extension_path}/spec/spec_helper.rb"
        m.file     'spec.opts',           "#{extension_path}/spec/spec.opts"
        m.file     'cucumber.yml',        "#{extension_path}/cucumber.yml"
        m.template 'cucumber_env.rb',     "#{extension_path}/features/support/env.rb"
        m.template 'cucumber_paths.rb',   "#{extension_path}/features/support/paths.rb"
      end
    end
=======
  def templates
    template 'README.md',     "#{extension_path}/README.md"
    template 'VERSION',       "#{extension_path}/VERSION"
    template 'extension.rb',  "#{extension_path}/#{extension_file_name}.rb"
>>>>>>> generators being rewritten in rails3 style
  end
  
  private
  
  def class_name
    "#{extension_name.classify}Extension"
  end
  
  def extension_file_name
    "#{extension_name.underscore}_extension"
  end
  
  def extension_path
    "vendor/extensions/#{extension_name.underscore}"
  end
  
  def homepage
    %x[git config user.name] ? "http://github.com/#{%x[git config user.name].gsub("\n",'')}/radiant-#{extension_file_name}-extension" : "http://yourwebsite.com/#{extension_file_name}"
  end
  
end
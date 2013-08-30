require 'redmine'
require 'redmine_multi_column_custom_fields/hooks'
require 'redmine_multi_column_custom_fields/issues_helper_patch'


Redmine::Plugin.register :redmine_multi_column_custom_fields do
  
  requires_redmine :version_or_higher => '2.1.0'
  
  name 'Redmine Multi Column Custom Fields plugin'
  author 'David S Anderson'
  description 'Allows a custom field to span all column in an issue.'
  version '0.0.1'
  url 'https://github.com/ande3577/redmine_multi_column_custom_fields'
  author_url 'https://github.com/ande3577/'
end

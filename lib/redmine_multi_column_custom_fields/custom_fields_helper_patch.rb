module CustomFieldsHelperPatch
  def self.included(base)
    unloadable
    
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)
    base.class_eval do
      alias_method_chain :custom_field_tag_with_label, :multicolumn
    end
  end
  
  module ClassMethods
  end
  
  module InstanceMethods
  end
  
  def custom_field_tag_with_label_with_multicolumn(name, custom_value, options={})
    html = ""
    if custom_value.custom_field.multi_column
      html << '</div></div><div class="span"><p>'
    end
    html << custom_field_tag_with_label_without_multicolumn(name, custom_value, options)
    if custom_value.custom_field.multi_column
      html << '</div><div class="splitcontent"><div class="splitcontentleft">'
    end
    html.html_safe()
  end
  
end

CustomFieldsHelper.send(:include, CustomFieldsHelperPatch)
module RedmineMultiColumnIssuesHelperPatch
  module IssuesHelperPatch
    unloadable
    
    def self.included(base)
      base.send(:include, InstanceMethods)
      base.class_eval do
        alias_method_chain :render_custom_fields_rows, :multi_column
      end
    end
    
    module InstanceMethods
      def render_custom_fields_rows_with_multi_column(issue)
        values = issue.visible_custom_field_values(User.current)
        return if values.empty?
          
                
        l = ""
        r = ""      
        s = "<tr>\n"
        n = 0
        last_multi_column = false
        values.compact.each do |value|
          if value.custom_field.multi_column?   
            s << build_non_multi_column(l,r)  if l != ""
             l = ""
             r= ""
            s << "</tr><tr>\n"
            s << "<td colspan='4'><div class='wiki'>\n"
            s << "<hr />\n"
            s << "<p><strong>#{ h(value.custom_field.name) }</strong></p><br />\n"
            s << "<p>#{ simple_format_without_paragraph(h(show_value(value))) }</p>\n"
            s << "</div></td></tr>"
            n = 0
          else
            s << "<hr />\n" if last_multi_column
            l << "<div class=\"cf_" + h(value.custom_field_id) + " attribute\"><div class=\"label\">"+h(value.custom_field.name)+"</div><div class=\"value\">"+h(show_value(value))+"</div></div>" if n % 2  == 0
            r << "<div class=\"cf_" + h(value.custom_field_id) + " attribute\"><div class=\"label\">"+h(value.custom_field.name)+"</div><div class=\"value\">"+h(show_value(value))+"</div></div>" if n % 2  > 0 
            n += 1
          end
          last_multi_column = value.custom_field.multi_column?
        end
            
          s << build_non_multi_column(l,r)  if l != "" and not last_multi_column
            
            
        s << "</tr>\n"
        s.html_safe
      end
        
    def build_non_multi_column(left, right)
            string = ""
            string << "<div class=\"attributes\"><div class=\"splitcontent\"><div class=\"splitcontentleft\">"
            string << left
            string << '</div><div class="splitcontentleft">'
            string << right
            string << "</div></div></div>"     
            return string
    end     
        
      
      def next_multi_column_index(issue, index, custom_field_values)
        next_index = index
        while ((next_index < custom_field_values.size) && !custom_field_values[next_index].custom_field.multi_column?) do
          next_index += 1
        end
        return next_index
      end
      
    end
    
  end
end

IssuesHelper.send(:include, RedmineMultiColumnIssuesHelperPatch::IssuesHelperPatch)

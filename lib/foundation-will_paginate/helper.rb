module Foundation
  module WillPaginate
    module Helper
      def foundation_paginate(pages, pagination_for = nil)
        #be out early if new parm
        if pagination_for.nil?
          will_paginate(pages, :class => 'pagination', :inner_window => 2, :outer_window => 0, :renderer => Foundation::WillPaginate::Renderer, :previous_label => '&laquo;'.html_safe, :next_label => '&raquo;'.html_safe)
        else
          #else lets run the params, and the only reason i forked this.
          #update the sort state to match the pagination state!
          if params[:state] != pagination_for
            request.parameters.merge({:state => pagination_for})
          end
          will_paginate(pages, :params => {:pagination_for => "#{pagination_for}"}, :class => 'pagination', :inner_window => 2, :outer_window => 0, :renderer => Foundation::WillPaginate::Renderer, :previous_label => '&laquo;'.html_safe, :next_label => '&raquo;'.html_safe)
        end

      end
    end
  end
end
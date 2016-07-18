module Cms::Views::Contents
  class New
    include Cms::View

    def form
      form_for :content, routes.contents_path do
        %i(url title description list).each do |field|
          div class: 'input form-group' do
            label field
            text_field field, class: 'form-control'
          end
        end

        div class: 'controls' do
          submit 'Create content', class: 'btn btn-large btn-primary'
        end
      end
    end
  end
end

module Cms::Controllers::Contents
  class Create
    include Cms::Action

    expose :content

    def call(params)
      @content = ContentRepository.create(Content.new(params[:content]))
      redirect_to '/cms/contents'
    end
  end
end

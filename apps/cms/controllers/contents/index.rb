module Cms::Controllers::Contents
  class Index
    include Cms::Action
    expose :contents

    def call(params)
      @contents = ContentRepository.all
    end
  end
end

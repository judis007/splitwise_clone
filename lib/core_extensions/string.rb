# frozen_string_literal: true

module CoreExtensions
  module String
    def cut_string
      slice(0, 10)
    end
  end
end

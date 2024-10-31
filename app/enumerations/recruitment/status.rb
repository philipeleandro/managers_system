# frozen_string_literal: true

class Recruitment::Status < EnumerateIt::Base
  associate_values(
    :started,
    :finished
  )
end

# frozen_string_literal: true

class Hirer::Status < EnumerateIt::Base
  associate_values(
    :active,
    :inactive
  )
end

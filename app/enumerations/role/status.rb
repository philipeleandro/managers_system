# frozen_string_literal: true

class Role::Status < EnumerateIt::Base
  associate_values(
    :new,
    :in_progress,
    :finalized
  )
end

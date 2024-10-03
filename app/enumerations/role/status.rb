# frozen_string_literal: true

class Role::Status < EnumerateIt::Base # rubocop:disable Style/ClassAndModuleChildren
  associate_values(
    :new,
    :in_progress,
    :finalized
  )
end

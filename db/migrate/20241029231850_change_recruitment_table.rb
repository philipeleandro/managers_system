# frozen_string_literal: true

class ChangeRecruitmentTable < ActiveRecord::Migration[7.2]
  def change
    change_column_null :recruitments, :hirer_id, false
    change_column_default :recruitments, :status, from: 'new', to: 'started'
  end
end

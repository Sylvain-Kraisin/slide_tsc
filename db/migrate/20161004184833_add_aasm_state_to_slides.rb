class AddAasmStateToSlides < ActiveRecord::Migration[5.0]
  def change
    add_column :slides, :aasm_state, :string
  end
end

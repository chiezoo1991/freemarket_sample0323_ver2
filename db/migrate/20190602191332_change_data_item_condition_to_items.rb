class ChangeDataItemConditionToItems < ActiveRecord::Migration[5.0]
  def change
    change_column :items, :item_condition, :integer
  end
end

class AddCommenttextToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :comment_text, :text
  end
end

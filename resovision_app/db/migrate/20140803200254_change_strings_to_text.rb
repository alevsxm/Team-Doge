class ChangeStringsToText < ActiveRecord::Migration
  def change
    remove_column :resovisions, :headline
    remove_column :resovisions, :pic_url
    remove_column :positions, :summary
    remove_column :videos, :video_name

    add_column :resovisions, :summary, :text

    add_column :resovisions, :headline, :text
    add_column :resovisions, :pic_url, :text
    add_column :positions, :summary, :text
    add_column :videos, :video_name, :text

  end
end

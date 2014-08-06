class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string(:video_name)
      t.references(:resovision)
      t.references(:position)
      t.references(:education)
    end
  end
end

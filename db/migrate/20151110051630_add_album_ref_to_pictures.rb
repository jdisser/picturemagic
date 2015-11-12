class AddAlbumRefToPictures < ActiveRecord::Migration
  def change
    add_reference :pictures, :album, index: true, foreign_key: true
  end
end

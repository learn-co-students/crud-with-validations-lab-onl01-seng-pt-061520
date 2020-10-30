class AddReleasedAndGenreToSongs < ActiveRecord::Migration[5.0]
  def change
    add_column :songs, :released, :boolean
    add_column :songs, :genre, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end

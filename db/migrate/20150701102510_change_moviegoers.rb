class ChangeMoviegoers < ActiveRecord::Migration
  def change
  	add_column :moviegoers, :admin, :boolean, default: false
  end

  def down
  end
end

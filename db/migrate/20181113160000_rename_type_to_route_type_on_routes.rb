class RenameTypeToRouteTypeOnRoutes < ActiveRecord::Migration[5.2]
  def change
    rename_column :routes, :type, :route_type
  end
end

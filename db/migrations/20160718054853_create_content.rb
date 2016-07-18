Hanami::Model.migration do
  change do
    create_table :contents do
      primary_key :id
      column :url,         String, null: false
      column :title,       String, null: false
      column :image_url,   String
      column :description, String
      column :list,        String
    end
  end
end

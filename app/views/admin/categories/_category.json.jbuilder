json.extract! category, :id, :name, :slug, :parent_id, :created_at, :updated_at
json.url category_url(category, format: :json)

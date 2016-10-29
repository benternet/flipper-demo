json.extract! item, :id, :title, :notes, :due_at, :list_id, :created_at, :updated_at
json.url item_url(item, format: :json)
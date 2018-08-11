json.extract! reviewer, :id, :name, :user, :review, :created_at, :updated_at
json.url reviewer_url(reviewer, format: :json)

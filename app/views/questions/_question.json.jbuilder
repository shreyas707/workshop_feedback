json.extract! question, :id, :title, :order, :question_type_id, :created_at, :updated_at
json.url question_url(question, format: :json)

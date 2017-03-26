json.extract! workshop, :id, :title, :description, :start_date, :end_date, :token, :user_id, :department_id, :allow_access, :created_at, :updated_at
json.url workshop_url(workshop, format: :json)

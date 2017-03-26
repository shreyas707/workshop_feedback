json.extract! instructor, :id, :name, :mobile, :email, :address, :profile, :department_id, :created_at, :updated_at
json.url instructor_url(instructor, format: :json)

json.array!(@visitormailers) do |visitormailer|
  json.extract! visitormailer, :id, :name, :email, :login
  json.url visitormailer_url(visitormailer, format: :json)
end

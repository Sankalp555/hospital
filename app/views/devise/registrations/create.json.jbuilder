json.user do |json|
  json.partial! 'users/user_created', user: resource
end
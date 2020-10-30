json.(user, :id, :email, :first_name, :middle_name, :last_name, :gender, :phone_number, :user_type)
json.token user.generate_jwt
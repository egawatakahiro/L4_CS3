require 'bcrypt'

signup_password = BCrypt::Password.create("my")
puts signup_password

User.find_by(uid: params[:uid])


login_password = BCrypt::Password.new(user.pass)
if login_password == "my" #params[;pass]
    puts "OK"
end
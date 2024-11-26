*** Variables ***

# Open Website and Browser
${url}                 http://the-internet.herokuapp.com/login
${browser_chrome}      chrome

# Username and password
${username_input}      id:username
${password_input}      id:password

# Buttons
${login_button}        //i[@class="fa fa-2x fa-sign-in"]
${logout_button}       //i[@class="icon-2x icon-signout"]

# Messages
${msg_error}           id:flash
${msg_login_success}   You logged into a secure area!
${msg_password_fail}   Your password is invalid!
${msg_logout_success}  You logged out of the secure area!
${msg_username_fail}   Your username is invalid!

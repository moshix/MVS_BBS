/* BBS System in REXX */
/* copyright 2023 by moshix */


/* Initialize the BBS */
call initBBS

/* Main menu */
do while 1
  say "Welcome to the BBS!"
  say "1. Register"
  say "2. Login"
  say "3. Exit"
  input "Enter your choice: " choice

  select
    when choice = "1" then call registerUser
    when choice = "2" then call loginUser
    when choice = "3" then leave
    otherwise say "Invalid choice. Please try again."
  end
end

/* Initialize the BBS */
initBBS:
  /* Create user and message files if they don't exist */
  if \sysfile("test", "user.txt") then do
    call sysfile "test", "user.txt", "new"
  end
  if \sysfile("test", "messages.txt") then do
    call sysfile "test", "messages.txt", "new"
  end
  return

/* Register a new user */
registerUser:
  input "Enter your username: " username
  input "Enter your password: " password

  /* Check if the user already exists */
  if \sysfile("test", "user.txt") then do
    call sysfile "test", "user.txt", "new"
  end
  if \sysfile("test", "user.txt", "query", username) then do
    say "Username already exists. Please choose a different username."
    return
  end

  /* Add the user to the user file */
  call sysfile "test", "user.txt", "append", username || "," || password
  say "User registered successfully."
  return

/* Login a user */
loginUser:
  input "Enter your username: " username
  input "Enter your password: " password

  /* Check if the user exists */
  if \sysfile("test", "user.txt", "query", username) then do
    say "Invalid username. Please try again."
    return
  end

  /* Validate the password */
  user = sysfile("test", "user.txt", "query", username)
  if password \= substr(user, pos(",", user) + 1) then do
    say "Invalid password. Please try again."
    return
  end

  /* User logged in successfully */
  say "Welcome, " || username || "!"
  call mainMenu
  return

/* Main menu after login */
mainMenu:
  do while 1
    say "Main Menu"
    say "1. View Message Boards"
    say "2. Send Private Message"
    say "3. Logout"
    input "Enter your choice: " choice

    select
      when choice = "1" then call viewMessageBoards
      when choice = "2" then call sendPrivateMessage
      when choice = "3" then leave
      otherwise say "Invalid choice. Please try again."
    end
  end
  return

/* View message boards */
viewMessageBoards:
  /* Read messages from file */
  messages = sysfile("test", "messages.txt", "read")

  /* Display messages */
  say "Message Boards"
  say "--------------"
  say messages
  return

/* Send a private message */
sendPrivateMessage:
  input "Enter recipient's username: " recipient
  input "Enter your message: " message

  /* Append the message to the recipient's private message file */
  call sysfile "test", recipient || ".txt", "append", message
  say "Private message sent successfully."
  return

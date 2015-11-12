import bcrypt
password = "admin"
password  = password.encode("utf8")
# Hash a password for the first time, with a randomly-generated salt
hashed = bcrypt.hashpw(password, bcrypt.gensalt(10))
# Check that a unhashed password matches one that has previously been
#   hashed
if bcrypt.hashpw(password, hashed) == hashed:
    print("It Matches!")
    print(hashed)
else:
    print("It Does not Match :(")
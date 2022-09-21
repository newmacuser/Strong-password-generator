# Strong-password-generator
Description: This is a generator that creates a random strong password with a mixture of both uppercase and lowercase letters, numbers, and special characters. When it creates a strong and random password, it also generates a recovery key. 

Requirement: Must be executed on a Linux machine running Ubuntu OS (20.04 or higher) or Debian OS (10 or higher). 

Dependency: uuid-runtime

    sudo apt install uuid-runtime -y

Usage: 

    # Example, for Ubuntu users, execute:
    ./SP.ubuntu.gen
    # Then, follow the instructions to fill in the required information for a unique password.
    # You will find a output file 'recovery.key' in the same directory.
    # For recovering an old password, simply execute:
    ./SP.ubuntu.rec
    # Follow the instructions to fill in your recovery key and user information.

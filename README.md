# Strong-password-generator
Description: This is a generator that randomly creates a strong password with a mixture of both uppercase and lowercase letters, numbers, and special characters. However, when it creates a password, it also generates a recovery key. 

Requirement: Must be executed on a Linux machine running Ubuntu OS (20.04 or higher) or Debian OS (10 or higher). 

Dependency: uuid-runtime

    sudo apt install uuid-runtime -y

Usage: 

    # Example, for Ubuntu users, execute:
    ./passwd_gen.sh
    # Then, follow the instructions to fill in the required information for a unique password.
    # You will find an output file 'passrecovery.key' in the same directory.
    
    # For recovering an old password, simply execute:
    ./passwd_rec.sh
    # Follow the instructions to fill in your recovery key and user information.

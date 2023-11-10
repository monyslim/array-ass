#!/bin/bash
declare -a users

sudo su
users=("james:password1" 
       "john:password2")

    #    #create groups
    # sudo groupadd others
    # sudo groupadd support
    
    # #add users to groups
    # sudo usermod -aG others james,jerry
    # sudo usermod -aG support mary,john

# Loop through the array and create users
for item in ${users[@]}
    do
    user=$(echo "$item" | cut -d: -f1)
    password=$(echo "$item" | cut -d: -f2)
    # user_id=$(echo "$item" | cut -d: -f3)
    # group=$(echo "$item" | cut -d: -f4)

    user_home="/home/$user"

    # Check if the user's home directory exists; if not, create it
    [ -d "$user_home" ] || sudo mkdir -m 700 "$user_home"

    # Create the user
    sudo useradd -d "$user_home" -m -s "/bin/bash" -u "$user_id" "$user"

    # Set the user's password
    echo "$user:$password" | sudo chpasswd

    # # Add the user to the specified group
    # sudo usermod -aG "$group" "$user"
done

exit





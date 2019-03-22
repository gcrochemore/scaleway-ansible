# Scaleway Ansible

This is an ansible configuration for my [scaleway](https://scaleway.com) servers. 

## Requirements

This ansible configuration is designed for a **C2M scaleway server** with **Ubuntu Bionic Beaver**.
It should be working with others servers. In this case, please give me a feedback and I will update this part. 

## Installation 

1. Connect on the server with `root` account.
2. Clone the repository: 

    ```sh
        git clone https://github.com/VPecquerie/scaleway-ansible.git 
    ```
3. Make the *install.sh* script executable:
    ```sh
        chmod +x install.sh
    ```
4. Adapt the vars.yml files with you needs.
5. Run the `install.sh` script
    ```sh
        ./install.sh
    ```
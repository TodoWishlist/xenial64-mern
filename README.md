Vagrant Box For MERN Project
=================
This is an all-in-one vagrant box for developing MERN projects.


## Read me first
Always Run Vagrant as **!!! Administrator !!!**
```
e.g. open CMD as Administrator, then type any vagrant commands
```

## Prerequisite
Git >= 1.9.x  
Vagrant >= 1.7.4  
VirtualBox >= 5.0.10

## How to start
1.  Download the vagrant box files from [Release Page](https://github.com/TodoWishlist/xenial64-mern/releases) and Unzip it (**Recommend**)  
    **OR**  
    Use git to obtain these files (**NOT Recommend**)  
    ```
    git clone https://github.com/TodoWishlist/xenial64-mern.git
    cd xenial64-mean
    rm -rf .git
    ```

2.  (Optional) You can change the nodejs version in folder **.provision/vagrant.sh**  
    For example, install latest 6.x version:  
    ```
    VAGRANT_NODE_VERSION=v6
    ```

3.  Run the following command (in the folder where Vagrantfile locates) to bring up and restart vagrant  
    ```
    vagrant up
    vagrant reload
    ```

4.  Connect to vagrant guest machine, when vagrant finishes 
    ```
    vagrant ssh
    ```

## Setup in vagrant
1.  Run the following command in guest Linux after **NEW** project is created under /vagrant.  
    ```
    helpnpm
    ```

    **For example:** (inside guest machine)  
    ```
    cd /vagrant
    git clone https://github.com/Hashnode/mern-starter.git
    cd mean
    helpnpm
    npm install
    grunt test
    ```

## (Optional) Recommend Operations

1.  Install Vagrant Plugins:
    a. Automatically Update VirtualBox Guest Addiction:  
    ```
    vagrant plugin install vagrant-vbguest
    ```

##  Licensing
The source code is licensed under GPL v3. License is available [here](/LICENSE).

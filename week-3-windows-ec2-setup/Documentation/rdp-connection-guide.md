##Secure RDP Connection Guide for windows EC2

Once the EC2 instance is in the "Running" state. Follow these steps;

###1. Get the Administrator Password

-Naviagte to the EC2 console
-Select the "Windows-EC2-Instance" instance
-Click the "Connect" button
-Select the **RDP Client** tab
-Click **Get password**.
-You will be asked to upload your **private key pair**
-Click **Decyrpt Password** and copy the generated password.

###2. Connect via Remote desktop
-Download the RDP FILE or use local RDP client
-Use the Public IP addres, username[Adminstrator], Password [The copied decrypted password]
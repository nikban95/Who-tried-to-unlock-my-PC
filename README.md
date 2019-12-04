### Who tried to unlock my PC

#### What is it about?
- It clicks the intruders photos who tried to access your system without your permission.
- On invalid login(wrong password), it clicks camera shots using webcam.
- It works only on Linux based systems.

#### Dependency:
- avconv

#### Setup
- Install the required dependencies.
- Go to /etc/pam.d/ location.
- Edit the 'common-auth' file.
````
cd /etc/pam.d/
sudo gedit common-auth
````
- Locate the line written below. It contains 'pam_unix.so' string.
````
    auth	[success=1 default=ignore]	pam_unix.so nullok_secure
````
- In this line, replace the 'success=1' with 'success=2' string.
````
    auth	[success=2 default=ignore]	pam_unix.so nullok_secure
````
- Now add a line below it:
````
    auth    optional                  pam_exec.so     (path to your script)
````
eg: 
````    
    auth    optional              pam_exec.so 		/home/nike/projects/wrongPasswordPic/wrongPasswordPicScript.sh
````
- Now on every invalid login, a web cam shot will be clicked. The shot will be stored at /var/tmp directory.

Feel free to suggest any change and contribute to it!!!

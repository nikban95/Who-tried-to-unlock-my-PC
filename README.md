# wrongPasswordFacePic
Takes Webcam shot on wrong password

It stores the picture at /var/tmp directory.

Dependency:

1. avconv

Usage:

1. Edit the pam common-suth file. Its location is /etc/pam.d/common-auth You can do it by: sudo gedit /etc/pam.d/common-auth

2. Locate the line written below. It contains pam_unix.so and is by default before the one with pam_deny.so :

    auth	[success=1 default=ignore]	pam_unix.so nullok_secure

3. In this line change the success=1 with success=2

4. Now add a line below it:

    auth    optional                  pam_exec.so     (path to your script)

    eg: auth    optional              pam_exec.so 		/home/nike/projects/wrongPasswordPic/wrongPasswordPicScript.sh

5. Now On every wrong login a webcam shot will be stored in /var/tmp directory.

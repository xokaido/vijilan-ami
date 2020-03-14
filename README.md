# About the project

This document describes how to build Custom Debian 9 image for Amazon Web Services ( AWS )
based on community AMI ( Amazon Machine Image ).

## Choosing Community AMI

In order to build custom AMI based on existing debian system we first need to choose correct image.
I'll start searching it through Community AMIs:

![Image of systems](https://i.imgur.com/Omi3xfI.png)


Note on the left I've chosen `Community AMIs` then `Debian` and `64 bit`

Next, we'll choose most recent version of stretch, in my case it was
`debian-stretch-hvm-x86_64-gp2-2020-02-10-73984` with ID:  `ami-0d270a69ac13b22c3`.

Clicking on the `next` button should get us to this page:

![Image of instances](https://i.imgur.com/h27Afbm.png)

Click on the `Review and Launch`, then `Launch`.
Choose correct keys to be able to access the instance via SSH or create new keys and `Launch instance`.

We now should have a running AWS instance. 


## Customizing the System

Connect to the new system ( through SSH ), download the script `vijilan.sh` and the file `selections.txt` from this repository:

```
  # wget vijilan.sh
  # wget selections.txt
```

Run as root:

```
  # dpkg --set-selections < selections.txt
  # apt-get install -y dselect
  # dselect install
  # bash vijilan.sh
``` 

When finished, the system should be customized and ready for use in Vijilan project.


## Creating New image

Go to the AWS console and right click on the instance name, you should get something like this:


![Image to create AMI](https://i.imgur.com/jnO3N0Y.png)

Click on the `Create Image` link and you should have it listed in your `IMAGES` link on the left ( AMIs ).
Wait some time for the status update and that's it, you have fully functional customized Debian 9 image ready for Vijilan project.





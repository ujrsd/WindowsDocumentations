## Installation

On a fresh installation of `Windows`, it is necessary to install `git` to share programming projects on different devices.

0. Download `git` on this site: [Git Download](https://git-scm.com/install/windows)
1. Open `VS-Code`. In the bottem left corner is a profile and settings icon. Click the profile icon and choose "Backup and Sync Settings".
2. The top bar will open with different settings and a button to "Sign in". Two options will be available:
    - Sign in with GitHub (**this one**)
    - Sign in with Microsoft
3. Follow the steps on [github](https://www.github.com) and link it with `VS-Code`.

Downloading any project will be done over the termianl with the following command:

```bash
git clone [LINK OF PROJECT]
```

## Git Login over terminal

After downloading a project and doing your first changes in a project, you will try to do a commit. But without any login, `git` will give you the following error:

<div style="text-align:center;">
    <img src="include/Git/git_login_error.png" style="width:50%">
</div>

This means you need to give `git` a username and an e-mail. To do this, open the terminal and use the following commands:

> ⚠️ Values in between **[ ]** are inputs done by you.

```bash
git config --global user.name [USERNAME]
git config --global user.email [E-MAIL]
```

These informations can be verified by using the same commands without an input:

```bash
git config --global user.name
git config --global user.email
```

Now, when commiting for the first time, the `git` software installed on the device will open up and ask for a sign in:

<div style="text-align:center;">
    <img src="include/Git/git_SW_login.png" style="width:50%">
</div>

Follow these steps on your webbrowser and afterwards git is fully functional.
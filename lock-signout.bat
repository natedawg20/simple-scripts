# Simple Windows Command Prompt (cmd) to lock or logout a signed-in user 
# Uncomment one line you want to use
#
# Note: To "Uncomment", remove the leading hash/pound sign [#]

# Lock workstation, but keep user signed in. Similar to [WinKey]+[L]
# Curtesy of HowtoGeek
# https://www.howtogeek.com/686575/how-to-lock-your-windows-10-pc-using-command-prompt/

#Rundll32.exe user32.dll,LockWorkStation

#Logout user  (Completely sign them out)
#shutdown /l
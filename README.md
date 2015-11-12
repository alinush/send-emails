send-emails
===========

This script sends an individual email to each email address specified in a file (better than mass-mailing or BCC'ing).

Here's how to use it:

 0. Write your email address (i.e. the address that will appear as the sender) in `from.txt`
 1. Write your HTML-formatted email in `email.html`
 2. Put each recipient's email address (i.e. recipient@mit.edu), no names or other funky stuff on a separate line in `dest.txt`
 3. Run `./send-email.sh`. The script will prompt you for the title of the email.

Done.

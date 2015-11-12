fromfile="from.txt"
destfile="dest.txt"
emailfile="email.html"

if [ ! -f "$fromfile" ]; then
    echo "ERROR: '$fromfile' file with sender's email address does not exist"
    exit 1
fi

if [ ! -f "$destfile" ]; then
    echo "ERROR: '$destfile' file with the recipients' email addresses does not exist"
    exit 1
fi

if [ ! -f "$emailfile" ]; then
    echo "ERROR: Email body file '$emailfile' does not exist"
    exit 1
fi

# Get the sender's email
from="`cat from.txt`"

# Get recipients
all=`for to in $(cat $destfile); do echo -n "$to "; done`

# Print the email out for the user
email=`cat $emailfile`
echo "The email reads:"
echo " -- BEGIN --"
echo "$email"
echo " -- END --"
echo

# Confirm sending of email with the user
read -p "Are you sure you ($from) want to send this email to: \"$all\" ? [y/N]: " ANS

echo
if [ "$ANS" != "y" ]; then
    echo "Okay, exiting..."
    exit
fi

# Prompt for email title
read -p "Please enter title: " title

# Send to each recipient separately
for to in `cat $destfile`; do
    echo "Emailing $to ..."
    echo "$email" | mail -a "Content-Type: text/html" -s "$title" "$to" -r "$from"
done

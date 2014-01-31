#/bin/bash

cd /www/aware
./up_api.sh
./up_web.sh

cd /www/aware/pi/api
`(perl script/email_consumer.pl > /tmp/email.log 2>&1 &) > /dev/null`
`(perl script/email_error_consumer.pl > /tmp/email.err 2>&1 &) > /dev/null`


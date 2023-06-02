# SMS_Sender
Send sms for free using a PowerShell script

It is possible that you must authorize the execution of script on your machine, for that open a window powershell in administrator and execute the following command :
`set-executionpolicy unrestricted`

The script uses the `textbelt.com` API and limits the use per ip address to one sms per day but also to one recipient number per day.

So if you have 100 proxies, you can send an sms to 100 different phone numbers.

The phone number, it must be in the format :
`country_code + number`
For example in France:
`+33674589652`

You will find the country codes here:
https://countrycode.org

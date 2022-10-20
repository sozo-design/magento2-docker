Becoming a CA
-------------

## Create the key
This generates the private key

`openssl genrsa -des3 -out sozoca.key 2048` password used is `av293JY$fY9wq5h#m^U&A46V@R`


## Create the Root Certificate
This generate the root ca certificate

`openssl req -x509 -new -nodes -key sozoca.key -sha256 -days 1825 -out sozocacert.pem`

Enter the private key password then the following

```
Country Name (2 letter code) [AU]:GB
State or Province Name (full name) [Some-State]:Gloucestershire
Locality Name (eg, city) []:Cheltenham
Organization Name (eg, company) [Internet Widgits Pty Ltd]:SOZO Design Ltd
Organizational Unit Name (eg, section) []:
Common Name (e.g. server FQDN or YOUR name) []:SOZO Design
Email Address []:clive@sozodesign.co.uk
```


## Root Certificate Installation

### MacOS
`sudo security add-trusted-cert -d -r trustRoot -k "/Library/Keychains/System.keychain" sozocacert.pem`

### Linux
Make sure you have the `ca-certificates` package installed.

Ubuntu: `sudo apt-get install -y ca-certificates`

Copy the Root Certificate to the store `sudo cp ${PWD}/sozocacert.pem /usr/local/share/ca-certificates/sozocacert.crt`

Update the CA Store `sudo update-ca-certificates`

Test it's present with 
`awk -v cmd='openssl x509 -noout -subject' '/BEGIN/{close(cmd)};{print | cmd}' < /etc/ssl/certs/ca-certificates.crt | grep SOZO`

### Windows
*coming soon*

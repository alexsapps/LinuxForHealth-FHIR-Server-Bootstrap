# Certs

Here are instructions for how to re-create the contents of this directory.

These instructions are from https://www.section.io/engineering-education/how-to-get-ssl-https-for-localhost/ and customized for our use case.

Create a certificate authority key and cert, then create a key for localhost and a cert for localhost signed by the certificate authority.

When prompted for "common name" field in below steps, use `host.docker.internal` - this is the hostname we use throughout this project when creating the Docker container.

* Make root CA private key: `openssl genrsa -out CA.key -des3 2048`
* Make root CA cert: `openssl req -x509 -sha256 -new -nodes -days 3650 -key CA.key -out CA.pem`
* Install the root CA in the Windows root certificate store for your local user, if you want to test it using your browser.
* Create settings file for future steps as `localhost.ext`:
    ```
    authorityKeyIdentifier = keyid,issuer
    basicConstraints = CA:FALSE
    keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
    subjectAltName = @alt_names

    [alt_names]
    DNS.1 = localhost
    DNS.2 = host.docker.internal
    IP.1 = 127.0.0.1
    ```
* Make server key: `openssl genrsa -out localhost.key -des3 2048`
* Make certificate request: `openssl req -new -key localhost.key -out localhost.csr`
* Make certificate: `openssl x509 -req -in localhost.csr -CA CA.pem -CAkey CA.key -CAcreateserial -days 3650 -sha256 -extfile localhost.ext -out localhost.crt`
* Decrypt key: `openssl rsa -in localhost.key -out localhost.decrypted.key`

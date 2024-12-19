mkdir certs
cd certs

# Generar la CA (autoridad certificadora)
openssl genrsa 2048 > ca-key.pem
openssl req -new -x509 -nodes -days 3650 -key ca-key.pem -out ca.pem -subj "/CN=MySQL-CA"

# Generar la clave para el servidor
openssl genrsa 2048 > server-key.pem

# Generar la solicitud de firma de certificado (CSR) para el servidor
openssl req -new -key server-key.pem -out server-req.pem -subj "/CN=MySQL-Server"

# Firmar el certificado del servidor con la CA
openssl x509 -req -in server-req.pem -days 3650 -CA ca.pem -CAkey ca-key.pem -set_serial 01 -out server-cert.pem

cd ..

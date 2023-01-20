from http.server import HTTPServer, BaseHTTPRequestHandler
import ssl
import http.server
import socketserver

PORT = 4443

class Handler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory="synthea\\output\\fhir\\", **kwargs)

with socketserver.TCPServer(("", PORT), Handler) as httpd:
    httpd.socket = ssl.wrap_socket (
        httpd.socket,
        # See localhost-https.md for setup instructions.
        keyfile = '.\\certs\\localhost.decrypted.key',
        certfile = '.\\certs\\localhost.crt',
        server_side=True
        )
    print('Serving Synthea output at https://localhost:' + str(PORT))
    httpd.serve_forever()

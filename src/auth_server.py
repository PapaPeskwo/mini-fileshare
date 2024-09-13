import base64
import http.server
import os

USERNAME = os.environ.get('AUTH_USERNAME')
PASSWORD = os.environ.get('AUTH_PASSWORD')
CREDENTIALS = f"{USERNAME}:{PASSWORD}"

class AuthHandler(http.server.SimpleHTTPRequestHandler):
    def do_AUTHHEAD(self):
        self.send_response(401)
        self.send_header('WWW-Authenticate', 'Basic realm="Login Required"')
        self.send_header('Content-type', 'text/html')
        self.end_headers()

    def do_GET(self):
        auth_header = self.headers.get('Authorization')
        if auth_header is None:
            self.do_AUTHHEAD()
            self.wfile.write(b'No auth header received')
        elif auth_header == 'Basic ' + base64.b64encode(CREDENTIALS.encode('ascii')).decode('ascii'):
            http.server.SimpleHTTPRequestHandler.do_GET(self)
        else:
            self.do_AUTHHEAD()
            self.wfile.write(b'Invalid credentials')

if __name__ == '__main__':
    os.chdir('./shared')
    server_address = ('', 23645)
    httpd = http.server.HTTPServer(server_address, AuthHandler)
    print('Running server on port 23645')
    httpd.serve_forever()
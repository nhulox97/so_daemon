import SimpleHTTPServer
import SocketServer
import os
PORT = 8000

class ServerHandler(SimpleHTTPServer.SimpleHTTPRequestHandler):

    def do_POST(self):
        content_len = int(self.headers.getheader('content-length', 0))
        post_body = self.rfile.read(content_len)
        query_components = dict(qc.split("=") for qc in post_body.split("&"))
        print query_components["param1"]
        if post_body=="DIR":
            print(os.getcwd())
        self.wfile.write(os.getcwd())
        self.wfile.write('\n')
        self.send_response(200)

Handler = ServerHandler
web_dir = os.path.join(os.path.dirname(__file__), '.')
os.chdir(web_dir)
httpd = SocketServer.TCPServer(("", PORT), Handler)

print "serving at port", PORT
httpd.serve_forever()

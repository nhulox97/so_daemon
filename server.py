import SimpleHTTPServer
import SocketServer
import os
import subprocess
PORT = 8000

class ServerHandler(SimpleHTTPServer.SimpleHTTPRequestHandler):

    """
    El formato para obtener los parametros es el siguiente:
    "menu": 'menu_name' el identificador del menu del daemon
    "option": 'option name' el identificador de la 
    opcion del menu del dameon
    """
    def do_POST(self):
        content_len = int(self.headers.getheader('content-length', 0))
        post_body = self.rfile.read(content_len)
        query_components = dict(qc.split("=") for qc in post_body.split("&"))
        menu = query_components['menu']
        if menu == 'functions':
            option = query_components['option']
            if option == 'storage':
                value = subprocess.check_output(['./scripts/functions.sh', option])
            elif option == 'info':
                value = 'info'
            elif option == 'process':
                value = 'process'
            elif option == 'dirs':
                value = 'dirs'
        self.wfile.write(value)
        self.send_response(200)


Handler = ServerHandler
web_dir = os.path.join(os.path.dirname(__file__), '.')
os.chdir(web_dir)
httpd = SocketServer.TCPServer(("", PORT), Handler)

print "serving at port", PORT
httpd.serve_forever()

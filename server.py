import SimpleHTTPServer
import SocketServer
import os
import subprocess
PORT = 8000
'''
Author: Sergio Bernal (nhulox97)
'''
# El formato para obtener los parametros es el siguiente:
# "menu": 'menu_name' el identificador del menu del daemon
# "option": 'option name' el identificador de la 
# opcion del menu del dameon

class ServerHandler(SimpleHTTPServer.SimpleHTTPRequestHandler):
    def do_GET(self):
        self.wfile.write("Sergio's server")

    def do_POST(self):
        content_len = int(self.headers.getheader('content-length', 0))
        post_body = self.rfile.read(content_len)
        params = dict(qc.split("=") for qc in post_body.split("&"))
        menu = params['menu']
        value = '404 - Option not found'
        if menu == 'functions':
            script = './scripts/functions.sh'
            option = params['option']
            if option == 'storage':
                value = subprocess.check_output([script, option])
            elif option == 'info':
                value = subprocess.check_output([script, option])
            elif option == 'process':
                value = subprocess.check_output([script, option])
            elif option == 'dirs':
                value = subprocess.check_output([script, option])
            elif option == 'updates':
                value = subprocess.check_output([script, option])
            elif option == 'search':
                query = params['query']
                value = subprocess.check_output([script, option, query])
            elif option == 'ram':
                value = subprocess.check_output([script, option])
            elif option == 'network':
                value = subprocess.check_output([script, option])
            elif option == 'user':
                value = subprocess.check_output([script, option])
            elif option == 'users':
                value = subprocess.check_output([script, option])
            else:
                value = 'Opcion invalida'
        elif menu == 'wikidaemon':
            script = './scripts/wikidaemon.sh'
            word = params['word']
            value = subprocess.check_output([script, word])
        elif menu == 'backup':
            script = './scripts/backup.sh'
            db = params['db']
            receiver = params['receiver']
            value = subprocess.check_output([script, db, receiver])
        elif menu == 'maintenance':
            script = './scripts/maintenance.sh'
            option = params['option']
            if option == 'log':
                receiver = params['receiver']
                value = subprocess.check_output([script, option, receiver])
            elif option == 'backup':
                script = './scripts/backupremote.sh'
                value = subprocess.check_output([script, option])
            else:
                value = 'Opcion invalida'
        elif menu == 'awk':
            script = './scripts/awk.sh'
            option = params['option']
            if option == '1':
                value = subprocess.check_output([script, option])
            elif option == '2':
                value = subprocess.check_output([script, option])
            elif option == '3':
                value = subprocess.check_output([script, option])
            elif option == '4':
                value = subprocess.check_output([script, option])
            elif option == '5':
                value = subprocess.check_output([script, option])
            elif option == '6':
                value = subprocess.check_output([script, option])
            elif option == '7':
                value = subprocess.check_output([script, option])
            elif option == '8':
                value = subprocess.check_output([script, option])
            elif option == '9':
                value = subprocess.check_output([script, option])
            else:
                value = 'Opcion invalida'

        self.wfile.write(value)
        self.send_response(200)


Handler = ServerHandler
web_dir = os.path.join(os.path.dirname(__file__), '.')
os.chdir(web_dir)
httpd = SocketServer.TCPServer(("", PORT), Handler)

print "serving at port", PORT
httpd.serve_forever()

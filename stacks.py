import os
import sys
import time
import zipfile
import datetime
import docker
from dotenv import load_dotenv

class Stacks:
    """Simple class for docker builds"""

    path = ""
    tags = ""
    folder_name = ""

    def __init__(self, mode):
        print "Script done!!"
        self.mode = mode
        self.local_dir = ""
        self.plugin_path = os.getcwd() + "/" + self.local_dir

        load_dotenv()

    def __del__(self):
        print "Script done!!"

    def config_php(self):
        client = docker.from_env()

        project_name = os.environ['PROJECT_NAME']

        php_cont = "{name}_php".format(name=project_name)
        print php_cont

        # client.containers.run("php", 'php -i', detach=True)

        # for container in client.containers.list():
        #     print "{name}   {id}".format(name=container.name, id=container.id)

        # Todo : configure php settings in ini file
        # Todo : configure a custom domain in apache
        # Todo : configure all other variables in project setup

    def config_all(self):
        client = docker.from_env()

        for volume in client.volumes.list():
            print "{name}   {id}".format(name=volume.name, id=volume.id)

            # todo: create volumes
            # todo: configure php & variables


def runner_handler(event):
    if len(event) > 0:
        fc = Stacks

        if event['mode'] == "start":
            _cmd = "docker-compose up -d --build"
            os.system(_cmd)

        elif event['mode'] == "stop":
            _cmd = "docker-compose kill"
            os.system(_cmd)

        elif event['mode'] == "config_all":
            fc.config_all(Stacks(event['path']))

        elif event['mode'] == "config_php":
            fc.config_php(Stacks(event['path']))


# Local testing
print sys.argv

if len(sys.argv) > 2:
    event_local = {'mode':  sys.argv[1], 'path':  sys.argv[2]}
    runner_handler(event_local)
else:
    event_local = {'mode':  "config_php", 'path': "."}
    runner_handler(event_local)

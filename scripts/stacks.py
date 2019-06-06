import os
import sys
import time
import zipfile
import datetime
import docker


class stacks:
    """Simple class for docker builts"""

    path = ""
    tags = ""
    folder_name = ""

    def __init__(self, mode):
        print "Script done!!"
        self.mode = mode
        self.local_dir = ""
        self.plugin_path = os.getcwd() + "/" + self.local_dir

    def __del__(self):
        print "Script done!!"

    def config_php(self):
        client = docker.from_env()

        for container in client.containers.list():
            print container.id

    # Todo : configure php settings in ini file
    # Todo : configure a custom domain in apache
    # Todo : configure all other variables in project setup


def runner_handler(event):
    if len(event) > 0:
        fc = stacks
        #  pass target folder/repo to script
        fc.config_php(stacks("todo"), event['path'])


# Local testing
print sys.argv

if len(sys.argv) > 1:
    event_local = {'path':  sys.argv[1]}
    runner_handler(event_local)
else:
    event_local = {'path': ""}
    runner_handler(event_local)

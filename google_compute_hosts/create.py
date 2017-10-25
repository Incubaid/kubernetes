from js9 import j
from pprint import pprint

j.clients.google_compute.init()

c = j.clients.google_compute

# res = c.instances_list()
# images = c.images_list()

pprint(c.images_ubuntu)

# key used will come from : j.application.config["ssh"]["sshkeyname"]
c.instance_create(name="builder1")

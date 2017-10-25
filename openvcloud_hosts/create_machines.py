from js9 import j


config = j.data.serializer.yaml.load("config.yaml")
applicationId = config["iyo"]["appid"]
secret = config["iyo"]["secret"]
url = config["openvcloud"]["url"]
sshkeyname = j.core.state.configMe["ssh"]["sshkeyname"]


def getClient():

    # jwt = j.clients.openvcloud.getJWTTokenFromItsYouOnline(
    #     applicationId, secret)

    c = j.clients.openvcloud.get(applicationId, secret, url)

    account = c.account_get("despiegk")

    print(account.spaces)

    space = account.spaces[0]

    return c, account, space


def createMachine(name):

    c, account, space = getClient()

    print("images")
    print([item["name"] for item in space.images])

    machine = space.machine_create_ifnotexist(
        name, sshkeyname=sshkeyname)
    # default arguments are ubuntu1604 and 2GB mem & 10 GB disk

    p = machine.prefab
    p.system.base.install()

    return p


def deleteMachinesInSpace():
    c, account, space = getClient()
    space.machines_delete()


deleteMachinesInSpace()

for i in range(3):
    name = "ku%s" % (i + 1)
    p = createMachine(name)

p = createMachine("proxy")

# when its already created we can go faster
# p = j.tools.prefab.get("195.143.34.114:2200")

p.js9.js9core.install()

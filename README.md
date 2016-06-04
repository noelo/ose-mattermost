# ose-mattermost
Example Mattermost server running on openshift

## Create the database

```
oc process  mysql-ephemeral -n openshift -v DATABASE_SERVICE_NAME=mmmysqldb -v MYSQL_USER=mmuser -v MYSQL_PASSWORD=mostest -v MYSQL_DATABASE=mattermost_test | oc create -f -
```

## Create the application with the command

```
oc new-app https://github.com/noelo/ose-mattermost.git
```

TODO: OSE Config maps for custom configuration

TODO: Persistent database

TODO: Persistent volume for mattermost data

TODO: nginx sidecar pod integration

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

## Expose the route
```
oc expose service ose-mattermost
```

### To Do

1. OSE Config maps for custom configuration
2. Persistent database
3. Persistent volume for mattermost data
4. nginx sidecar pod integration
5. Integrate auth provider
6. SSL Integration

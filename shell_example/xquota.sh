#!/bin/bash

# Remove quota from project0
xfs_quota -x -c 'limit -p bsoft=0 bhard=0 project0'

# New versions of /etc/proj[ects|id] , generated from database,
# should be moved to /etc at this point , after removing unwanted quotas


# Now we can initalize new projects and set quotas for them
xfs_quota -x -c 'project -s project1' /
xfs_quota -x -c 'limit -p bsoft=1000m bhard=1200m project1'

# Or ajust
xfs_quota -x -c 'limit -p bsoft=2000m bhard=2200m project2'

# Or execute both commands for existing and new projects
# and even create project directory if it is not exists
mkdir -p /projects/1
xfs_quota -x -c 'project -s project1' /
xfs_quota -x -c 'limit -p bsoft=3000m bhard=3200m project1'

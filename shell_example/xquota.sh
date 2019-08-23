#!/bin/bash

# Remove quota from project4
xfs_quota -x -c 'limit -p bsoft=0 bhard=0 project4'
xfs_quota -x -c 'project -C project4' /
# After this point, project4 should be excluded from /etc/proj[ects|id] files

# New versions of /etc/proj[ects|id] files, generated from database,
# should be moved to /etc at this point , after removing unwanted quotas

# 1.
# Now we can initalize new projects and set quotas for them,
# but the project directory should be there on the disk first
mkdir -p /projects/1
xfs_quota -x -c 'project -s project1' /
xfs_quota -x -c 'limit -p bsoft=1000m bhard=1200m project1'

# 2.
# Or ajust
xfs_quota -x -c 'limit -p bsoft=2000m bhard=2200m project2'

# 3.
# Or execute both xfs_quota commands for existing and new projects
# to ajust, add, or leave the same quota as it was before
mkdir -p /projects/1
xfs_quota -x -c 'project -s project1' /
xfs_quota -x -c 'limit -p bsoft=3000m bhard=3200m project1'

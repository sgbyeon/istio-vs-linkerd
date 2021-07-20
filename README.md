testbed
=======
- EKS: 1.19
- NodeGroup: m5.large x 3

load generator
==============
- locust

test applications
=================
- bookinfo with nodeSelector
- deploy 1 node with nodePort only

test specifications
===================
- 10 users/sec

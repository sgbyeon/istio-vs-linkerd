testbed
=======
- EKS 1.19
- NodeGroup
  * m5.large x 3
- istio 1.10.3
- linkerd 2.10.2 with nginx-ingress
- NodePort only

load generator
==============
- locust-1.6.0

test applications
=================
- bookinfo with nodeSelector
- deploy 1 node with nodePort only

test specifications
===================
- "Number of users to simulate" = 100 users
- "Spawn rate" (user spawned / second) = 10

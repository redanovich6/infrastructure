# Infrastructure

## Stockage: 
You can create on OperateFirst a PersistantVolumeClaim with a gp2 storage Class. Which that, you are able to perform actions on this PVC.
<img width="169" alt="image" src="https://user-images.githubusercontent.com/97517335/168229148-dedf65a8-06ea-4a11-bc28-49cd4d0fc19b.png">

There is an other way to store data on OPF. It's an S3 Bucket. But is not available on each cluster. On cl1 is not available.

```
apiVersion: objectbucket.io/v1alpha1
kind: ObjectBucketClaim
metadata:
  name: example-obc
spec:
  generateBucketName: example-obc
  storageClassName: openshift-storage.noobaa.io
```

This code Claim Bucket and after you can Accessing to this bucket from outside the cluster. [OPF Documentation](https://www.operate-first.cloud/apps/content/ocs/buckets-external-access.html)


## Expose:

I create a Route on OPF Cluster.

I try to Ask to Cert-Manager to Create an Issuer but I have problems with certification verification. I can't use DNS challenges and HTTP challenge configuration is wierd.

I add an annotation to the route [following this doc](https://www.operate-first.cloud/apps/content/acme/issuing_certificates.html) 

```
apiVersion: route.openshift.io/v1
kind: Route
metadata:
  annotations:
    kubernetes.io/tls-acme: "true"
```

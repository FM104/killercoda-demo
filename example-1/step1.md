Create deployment name: test-deploy image: nginx replicas: 1 port: 80
Run `k create deploy test-deploy --image nginx --replicas 1 --port 80`{{exec}}

Create service name: test-svc
Run `k expose deploy test-deploy --name test-svc`{{exec}}

Run below file

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: test-ingress
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  ingressClassName: nginx
  rules:
  - http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: test-svc
            port:
              number: 80
```

Check Page
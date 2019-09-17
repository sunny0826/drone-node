# drone-node
![](https://img.shields.io/docker/cloud/automated/guoxudongdocker/drone-node.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/guoxudongdocker/drone-node.svg)

node.js plugin of drone

```yaml
- name: "node build"
  image: "guoxudongdocker/drone-node"
  volumes:
  - name: "npm-cache"
    path: "/root/.npm-cache"
  settings:
    cmd: "npm run build"

...
volumes:
  -
    name: "npm-cache"
    host:
      path: "/cache/.npm-cache"
```
# Compile with the Docker


To compile the current folder with JBake:

`docker pull fasar/jbake`

```bash
$ mkdir public
$  docker run --rm  -it \
   --name jbake \
   --mount type=bind,source="$(pwd)",target="/site" \
   fasar/jbake jbake -b "/site" "/site/public" 
```

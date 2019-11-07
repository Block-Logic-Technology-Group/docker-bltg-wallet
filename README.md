# docker-bltg-wallet

get the latest bltg blockchain snapshot [here](https://github.com/Block-Logic-Technology-Group/Snapshots)

```
version: '3'
services:
  wallet:
    image: cpass78/bltg-wallet:latest
    deploy:
      replicas: 1    
    ports:
      - "17127:17127"
    volumes: 
      - /opt/bltg/data/:/home/bltg/.bltg/
```

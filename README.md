# docker-bltg-wallet

get the latest bltg blockchain snapshot here: TBD

```
version: '3'
services:
  wallet:
    image: cpass78/bltg:latest
    deploy:
      replicas: 1    
    ports:
      - "17127:17127"
    volumes: 
      - /opt/bltg/data/:/home/bltg/.bltg/
```

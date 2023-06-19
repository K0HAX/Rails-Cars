#!/bin/bash
docker run -ti --mount type=bind,source=./,destination=/app -p 127.0.0.1:3001:3001/tcp k0hax/lab-enginestats:latest /bin/bash

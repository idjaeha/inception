NAME = inception

all:
	@ $(MAKE) prune
	@ $(MAKE) local
	@ $(MAKE) reload

local:
	@ mkdir -p /home/jayi/data/db_data/
	@ mkdir -p /home/jayi/data/wordpress_data/

network:
	@ echo "127.0.0.1 jayi.42.fr" >> /etc/hosts
	
stop:
	@ docker-compose -f srcs/docker-compose.yml down

clean: stop
	@ rm -rf /home/jayi/data

prune: clean
	@ docker system prune -f

reload: 
	@ docker-compose -f srcs/docker-compose.yml up --build

.PHONY: local stop clean prune reload all network
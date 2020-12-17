docker_image_name="minecraft_docker"
docker build -t ${docker_image_name} .

docker run -d \
-p 25565:25565 \
--name=${docker_image_name} \
${docker_image_name}:latest

printf 'started %s\n' "${docker_image_name}"
printf ' exec - %s\n' "docker exec -it -u minecraft ${docker_image_name} /bin/bash"
printf ' exec (root) - %s\n' "docker exec -it -u minecraft ${docker_image_name} /bin/bash"
printf ' tail logs - %s\n' "docker logs -f ${docker_image_name}"

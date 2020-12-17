docker_image_name="minecraft_docker"

docker stop ${docker_image_name}
docker rm ${docker_image_name}

printf 'stopped %s\n' "${docker_image_name}"

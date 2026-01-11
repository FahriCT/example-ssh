docker run -d \
  --name ubuntu-ssh-gpu \
  --privileged \
  --gpus all \
  -e NVIDIA_VISIBLE_DEVICES=all \
  -e NVIDIA_DRIVER_CAPABILITIES=all \
  -e PUBLIC_KEY="ssh-ed25519 AAAA..." \
  -p 22:22 \
  koyeb/ubuntu-ssh-server:22.04

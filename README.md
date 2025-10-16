# Simple NGINX Server for HNG DevOps Stage 0

Hi Cool Keeds :rocket: Welcome to your first DevOps challenge! This repository contains everything you need to deploy a static page behind NGINX as required for the HNG13 Stage 0 DevOps task.

## ✅ Required Metadata (update before submission)
- **Name:** Prince Victor Orjiugo
- **Slack Username:** `@princeorjiugo`
- **Server URL:** `http://35.209.17.171/`

The landing page (`index.html`) has been updated with the same details. If anything changes (new IP, Slack handle, etc.), refresh both files before resubmitting.

## 📂 Project Structure
- `index.html` – Static landing page required by the brief. It currently displays Prince Victor Orjiugo, `@princevictororjiugo`, Google Cloud Platform, and the deployment date (16 October 2025). Update if you redeploy with different metadata.
- `Dockerfile` – Builds an NGINX image that serves content from `/var/www/html` as specified.
- `nginx/default.conf` – Custom server block pointing NGINX to `/var/www/html` on port 80.

## 🛠️ Prerequisites
- Docker installed locally (for building and testing the container).
- A publicly reachable server (cloud VPS or local machine with port forwarding) running Linux with Docker or bare-metal NGINX.

## 🚀 Local Development with Docker
Use Docker to verify everything works before deploying.

```bash
# Build the image
docker build -t simple-nginx-server .

# Run the container (binds port 80 inside the container to 8080 locally; adjust as needed)
docker run --rm -p 8080:80 simple-nginx-server
```

Visit `http://localhost:8080/` in your browser; you should see your customized Stage 0 page.

To stop the container, press `Ctrl+C` (because `--rm` cleans up automatically).

## 🌐 Deployment Steps (Outline)
1. **Provision a server** on your preferred provider (AWS EC2, GCP, Azure, DigitalOcean, Vultr, etc.). Open only port 80 in the firewall/security group.
2. **Install Docker** (or set up native NGINX):
   - Ubuntu example:
     ```bash
     sudo apt update
     sudo apt install -y docker.io
     sudo systemctl enable --now docker
     ```
3. **Clone your fork** of the repository on the server:
   ```bash
   git clone https://github.com/<your-github-username>/simple-nginx-server.git
   cd simple-nginx-server
   ```
4. **Customize `index.html`** (already completed for this deployment):
    - Current content shows:
       - `Welcome to DevOps Stage 0 - Prince Victor Orjiugo/@princeorjiugo`
       - `Successfully deployed on Google Cloud Platform`
       - `Deployed: 16 October 2025`
    - Update these lines if you roll out new details.
5. **Build and run** the container on the server:
   ```bash
   docker build -t simple-nginx-server .
   docker run -d --name simple-nginx -p 80:80 simple-nginx-server
   ```
6. **Verify** from another network (or an online HTTP checker) that `http://<your-server-ip>/` shows your custom page.
7. **Keep the container running** until the grading is complete.

## 📝 Submission Checklist
- [x] `README.md` updated with your actual name, Slack handle, and live server URL.
- [x] `index.html` updated with your details, platform, and deployment date.
- [x] Server running and reachable over HTTP on port 80 (`http://35.209.17.171/`).
- [ ] Submitted via Slack command `/stage-zero-devops` with the required info.
- [ ] Checked Thanos bot for the grading status.

## 🧹 Maintenance Tips
- To view logs of the running container: `docker logs -f simple-nginx`
- To restart the container: `docker restart simple-nginx`
- To stop and remove after grading: `docker rm -f simple-nginx`

Good luck, and enjoy your first DevOps deployment! 🎉

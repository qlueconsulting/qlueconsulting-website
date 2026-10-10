# QLUE Consulting - Data Technology & Fractional IT Consulting

An ultra-lightweight, high-performance static website packaged in an Alpine-based Docker container (~23MB footprint, <5MB RAM usage).

## 🚀 Overview

- **Core Practice Areas:**
  - **1. Data Technology Consulting:** Data pipelines, warehousing, database architecture, and analytics/AI readiness.
  - **2. Fractional IT Consulting:** Executive technology leadership, IT roadmaps, cloud systems, and vendor oversight.
  - **3. Proprietary Applications:** In-house software built from real-world consulting needs, including **AccoureAI** and **ScriptFlip**.
- **Contact:** Brian &bull; Phone: **970-324-7530** &bull; Email: **brian@qlueconsulting.com**
- **Pages Included:**
  - **Home (`index.html`):** Data Technology & Fractional IT services, practice highlights, and application spotlights.
  - **About & Services (`about.html`):** Deep-dive into data engineering, fractional CIO/IT director guidance, and Brian's practice.
  - **Apps (`apps.html`):** Dedicated showcases for **AccoureAI** and **ScriptFlip**, with feature breakdowns, capability cards, licensing tags, and custom development requests.
  - **Support & Policies (`support.html`):** Unified help & legal center with deep on-page bookmark links:
    - `#contact` &mdash; Direct phone (970-324-7530) and email (brian@qlueconsulting.com)
    - `#scriptflip-support` &mdash; Official ScriptFlip Help Center & FAQs (Restore Purchases, Subscriptions)
    - `#scriptflip-privacy` &mdash; ScriptFlip Privacy Policy & Third-Party Services (Anthropic, Supabase, RevenueCat)
    - `#general-support` &mdash; General QLUE Consulting & AccoureAI assistance
    - `#privacy` &mdash; Company data protection commitments
    - `#terms` &mdash; Terms of service & software licensing
    - `#cookies` &mdash; Cookie & local data storage policy
- **Lightweight & Fast:** Pure modern HTML5 & CSS3 with zero external fonts or tracking scripts. Instant load times.
- **Docker Native:** Runs on `nginx:alpine` with Gzip compression and optimized caching headers enabled.
- **Automated CI/CD:** GitHub Actions workflow included to automatically build and publish the Docker container to GitHub Container Registry (`ghcr.io`).

---

## 📦 Pushing to GitHub & Automated Docker Image Build

This repository includes a GitHub Actions workflow at [`.github/workflows/docker-build-push.yml`](.github/workflows/docker-build-push.yml) that automatically builds the Docker image and publishes it to **GitHub Container Registry (`ghcr.io`)** every time you push to `main`.

### Step 1: Initialize Git and Push to GitHub

Run these commands in this directory:

```bash
git init
git add .
git commit -m "feat: initial commit for QLUE Consulting website and Docker setup"
git branch -M main
git remote add origin https://github.com/<YOUR-USERNAME>/<YOUR-REPO-NAME>.git
git push -u origin main
```

### Step 2: Automated Build Runs on GitHub

Once pushed, GitHub Actions will:
1. Trigger the **Build and Publish Docker Image** workflow.
2. Build the Alpine-based Docker image using Docker Buildx.
3. Publish the image to:
   ```
   ghcr.io/<your-github-username-in-lowercase>/<your-repo-name-in-lowercase>:latest
   ```

> **Tip on Package Visibility:**
> In GitHub, go to your repository &rarr; **Packages** (on the right sidebar) &rarr; Click the package &rarr; **Package Settings** &rarr; Change visibility to **Public** if you want your deployment server to pull the image without needing a docker login token.

---

## 🚢 Deploying with Docker Compose on Your Server

### Method A: Deploy Using Prebuilt Image (Zero source code needed on server)

On your deployment server, you only need the [`docker-compose.server.yml`](docker-compose.server.yml) file.

1. Copy [`docker-compose.server.yml`](docker-compose.server.yml) to your server directory (e.g. `~/qlue-web/docker-compose.yml`).
2. Update the image name to your GitHub package path (or create a `.env` file):
   ```bash
   # .env
   DOCKER_IMAGE=ghcr.io/<your-username>/<your-repo>:latest
   PORT=8080
   ```
3. Start the container:
   ```bash
   docker compose up -d
   ```
4. Access your website at `http://<your-server-ip>:8080`!

To update the website in the future after pushing changes to GitHub:
```bash
docker compose pull
docker compose up -d
```

---

### Method B: Deploy from Cloned Repo on Server

If you clone this repository directly onto your server:

```bash
# Clone the repository
git clone https://github.com/<YOUR-USERNAME>/<YOUR-REPO-NAME>.git
cd <YOUR-REPO-NAME>

# Start with Docker Compose (builds and runs locally)
docker compose up -d
```

---

## 💻 Local Development

During local development, the `./html` directory is mounted into the container as a volume in `docker-compose.yml`, so any edits to HTML, CSS, or JS reflect immediately upon browser refresh without rebuilding:

```bash
# Start local development server
docker compose up -d

# Open in browser:
# http://localhost:8080

# Stop container
docker compose down
```

---

## 📁 Repository Structure

```text
QLUEConsulting_Website/
├── .github/
│   └── workflows/
│       └── docker-build-push.yml  # GitHub Actions CI for GHCR build & publish
├── docker-compose.yml             # Local / Dev Docker Compose configuration
├── docker-compose.server.yml      # Remote Server Production Compose (pulls from GHCR)
├── Dockerfile                     # Alpine-based Nginx container
├── nginx.conf                     # Nginx with gzip, security headers & routing
├── .dockerignore                  # Files excluded from container build
├── .gitignore                     # Git tracking exclusions
├── .env.example                   # Port and image configuration template
├── README.md                      # Documentation
└── html/                          # Website static content
    ├── index.html                 # Main Homepage
    ├── about.html                 # About Us
    ├── apps.html                  # Applications (AccoureAI & ScriptFlip)
    ├── support.html               # Support, FAQs, Privacy & Terms (Bookmarked)
    ├── 404.html                   # 404 Error page
    ├── css/
    │   └── style.css              # Modern CSS (no dependencies)
    └── js/
        └── main.js                # Navigation and scroll observer
```

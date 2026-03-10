# KB2026_MASTER

A meta-repository that aggregates all my GitHub projects into a single unified workspace. This repository serves as a central hub containing submodules for all my fullstack and backend-focused projects, making it easy to manage, develop, and deploy multiple related applications.

## 📋 Repository Structure

This is a **submodule-based monorepo** that contains all my GitHub repositories as git submodules. Each submodule is an independent project with its own history, issues, and release cycle.

```
KB2026_MASTER/
├── .gitmodules                 # Git submodules configuration
├── scripts/                     # Utility scripts for managing submodules
│   ├── sync-all.sh             # Sync all submodules
│   ├── update-all.sh           # Update all submodules to latest
│   ├── status-all.sh           # Check status of all submodules
│   └── init-all.sh             # Initialize all submodules
├── docs/                        # Cross-project documentation
└── [PROJECT_NAME]/             # Each submodule (your actual repos)
    ├── project-a/              # e.g., auth-service
    ├── project-b/              # e.g., api-gateway
    ├── project-c/              # e.g., frontend-app
    ├── project-d/              # e.g., data-processor
    └── ...                      # All your other repos
```

## 🗂️ Included Projects

### Backend Services
| Project | Description | Tech Stack | Status |
|---------|-------------|------------|--------|
| [auth-service](link) | Authentication & authorization microservice | Node.js, Express, JWT, PostgreSQL | Active |
| [api-gateway](link) | API Gateway routing all backend services | Node.js, Express, Redis | Active |
| [user-management](link) | User profile and preferences service | Python, Django, PostgreSQL | Active |
| [payment-processor](link) | Payment processing integration | Node.js, Stripe, MongoDB | Beta |
| [notification-service](link) | Email, SMS, and push notifications | Node.js, RabbitMQ, SendGrid | Active |
| [data-processor](link) | Background job processing service | Python, Celery, Redis | Active |
| [file-storage](link) | File upload and management service | Node.js, AWS S3, MinIO | Active |
| [analytics-service](link) | Data collection and analytics | Python, InfluxDB, Grafana | Planning |

### Fullstack Applications
| Project | Description | Tech Stack | Status |
|---------|-------------|------------|--------|
| [admin-dashboard](link) | Admin panel for managing all services | React, Redux, Material-UI | Active |
| [customer-portal](link) | Customer-facing web application | Vue.js, Vuex, Tailwind | Active |
| [mobile-api](link) | Backend API for mobile apps | Node.js, GraphQL, MongoDB | Beta |

### Utility Libraries
| Project | Description | Tech Stack | Status |
|---------|-------------|------------|--------|
| [shared-utils](link) | Common utilities shared across projects | TypeScript | Active |
| [database-models](link) | Shared database models and schemas | Prisma, Mongoose | Active |
| [logger-library](link) | Centralized logging library | Winston, ELK | Active |

## 🚀 Getting Started

### Prerequisites
- Git (v2.25+)
- Your preferred development tools for each project
- Docker & Docker Compose (for local development)

### Initial Setup

Clone the master repository with all submodules:

```bash
# Clone with submodules (recommended)
git clone --recursive https://github.com/yourusername/KB2026_MASTER.git

# OR clone normally and initialize submodules
git clone https://github.com/yourusername/KB2026_MASTER.git
cd KB2026_MASTER
git submodule update --init --recursive
```

### Working with Submodules

#### Quick Start Scripts
```bash
# Make scripts executable
chmod +x scripts/*.sh

# Initialize/update all submodules
./scripts/init-all.sh

# Check status of all projects
./scripts/status-all.sh

# Update all submodules to latest main branch
./scripts/update-all.sh

# Commit changes across submodules
./scripts/commit-all.sh "Your commit message"

# Push all changes
./scripts/push-all.sh
```

#### Manual Git Commands
```bash
# Update a specific submodule
cd project-name
git checkout main
git pull origin main
cd ..
git add project-name
git commit -m "Updated project-name to latest"

# Update all submodules
git submodule foreach git pull origin main

# Check which commits your submodules are on
git submodule status

# Initialize new submodules after clone
git submodule update --init --recursive
```

## 🔧 Development Workflow

### Local Development Setup

1. **Start all services** (using Docker Compose)
```bash
# From the master directory
docker-compose up -d

# This will start all dependent services
# - PostgreSQL
# - MongoDB
# - Redis
# - RabbitMQ
# - Each microservice
```

2. **Work on individual projects**
```bash
# Navigate to specific project
cd auth-service

# Create feature branch
git checkout -b feature/new-feature

# Make changes, commit, and push
git add .
git commit -m "Add new feature"
git push origin feature/new-feature
```

3. **Update master repository**
```bash
# After pushing changes to submodules
cd ..
git add auth-service
git commit -m "Update auth-service with new feature"
git push origin main
```

## 📊 Project Status Overview

```bash
# Quick overview of all projects
./scripts/status-all.sh

# This shows:
# - Current branch for each project
# - Uncommitted changes
# - Commits ahead/behind remote
# - Last commit message and date
```

## 🔄 Syncing Changes

### Pull latest from all projects
```bash
git pull --recurse-submodules
# OR
./scripts/sync-all.sh
```

### Push changes across multiple projects
```bash
# Commit and push changes in submodules
git submodule foreach 'git add . && git commit -m "Update" && git push'

# Update master repository
git add .
git commit -m "Synced all submodules"
git push
```

## 🐳 Docker Development Environment

The master repository includes a Docker Compose setup for running all services together:

```yaml
# docker-compose.yml
services:
  postgres:
    image: postgres:15
    # ...

  mongodb:
    image: mongo:6
    # ...

  redis:
    image: redis:7
    # ...

  rabbitmq:
    image: rabbitmq:3-management
    # ...

  # Each microservice
  auth-service:
    build: ./auth-service
    # ...

  api-gateway:
    build: ./api-gateway
    # ...
```

Run the entire stack:
```bash
docker-compose up -d
docker-compose logs -f
```

## 📝 Environment Configuration

Each project maintains its own `.env` file, but you can use shared configurations:

```bash
# Copy shared environment template
cp .env.example .env

# Each project can reference shared variables
# e.g., in auth-service/.env:
DATABASE_URL=${SHARED_DATABASE_URL}
REDIS_URL=${SHARED_REDIS_URL}
```

## 🔐 Access Management

### Repository Access
- All submodules are public/private based on individual repo settings
- SSH keys should be configured for each repository
- Personal access tokens for private repos

### Local Development Ports
| Service | Port | Project |
|---------|------|---------|
| API Gateway | 3000 | api-gateway |
| Auth Service | 3001 | auth-service |
| User Service | 3002 | user-management |
| Admin Dashboard | 4000 | admin-dashboard |
| Customer Portal | 4001 | customer-portal |
| PostgreSQL | 5432 | - |
| MongoDB | 27017 | - |
| Redis | 6379 | - |
| RabbitMQ | 15672 | - |

## 🛠️ Maintenance Scripts

### Scripts Overview
```bash
scripts/
├── init-all.sh          # Initialize all submodules
├── update-all.sh        # Update all submodules to latest
├── status-all.sh        # Show status of all projects
├── pull-all.sh          # Pull latest for all projects
├── push-all.sh          # Push changes from all projects
├── commit-all.sh        # Commit in all projects
├── checkout-all.sh      # Checkout branch in all projects
├── clean-all.sh         # Clean untracked files
└── docker-up-all.sh     # Start all services
```

## 📈 Monitoring & Logs

Centralized logging and monitoring across all projects:
- **Logs**: Each project logs to `./logs/[project-name]/`
- **Metrics**: Prometheus metrics exposed on project-specific ports
- **Tracing**: Distributed tracing with Jaeger (if configured)

## 🤝 Contributing Guidelines

### Adding a New Project
```bash
# Add new submodule
git submodule add https://github.com/yourusername/new-project.git

# Update .gitmodules (automatically done)
# Commit the change
git add .gitmodules new-project
git commit -m "Add new-project as submodule"
```

### Removing a Project
```bash
# Remove submodule entry
git submodule deinit -f project-name
rm -rf .git/modules/project-name
git rm -f project-name

# Commit the change
git commit -m "Remove project-name submodule"
```

### Best Practices
1. Always work in feature branches within submodules
2. Update master repository after submodule changes
3. Use `git submodule status` before committing
4. Test cross-project changes locally
5. Document project dependencies in this README

## 📚 Documentation

- [Architecture Overview](docs/architecture.md)
- [API Documentation](docs/api.md)
- [Deployment Guide](docs/deployment.md)
- [Development Setup](docs/development.md)
- [Project Dependencies](docs/dependencies.md)

## 🚢 Deployment

Individual projects can be deployed independently or together:

### Independent Deployment
```bash
cd auth-service
# Follow project-specific deployment instructions
```

### Stack Deployment
```bash
# Deploy all services
docker stack deploy -c docker-compose.prod.yml kb2026

# Or using Kubernetes
kubectl apply -f k8s/
```

## 🔍 Troubleshooting

### Common Issues

**Submodule not updating:**
```bash
git submodule update --remote --merge
```

**Detached HEAD state:**
```bash
cd project-name
git checkout main
```

**Merge conflicts in submodules:**
```bash
cd project-name
# Resolve conflicts normally
git add .
git commit
cd ..
git add project-name
git commit
```

## 📞 Contact & Support

- **Maintainer**: Your Name
- **Email**: your.email@example.com
- **GitHub**: [@yourusername](https://github.com/yourusername)
- **Project Board**: [Link to project board]

## 📄 License

This meta-repository and all submodules are licensed under their respective licenses. See individual projects for details.

This README now properly reflects that KB2026_MASTER is a meta-repository containing all your GitHub projects as submodules, with a focus on backend and fullstack applications.

# CIS-92 Project

This repository contains the CIS-92 course project, a comprehensive demonstration of modern web development and deployment practices. The project includes multiple applications, containerization, and Kubernetes orchestration.

## Project Overview

The CIS-92 project showcases:
- **Flask Web Application**: Simple authentication using cookies
- **Django Polls Tutorial**: Full-featured Django application following the official tutorial
- **Docker Containerization**: Containerized Django application
- **Kubernetes Deployment**: Complete cluster deployment with persistent storage
- **K9s Integration**: Kubernetes cluster management tool

## Repository Structure

```
cis-92/
├── app.py                    # Flask web application
├── Dockerfile               # Docker container configuration
├── LICENSE                  # Apache License 2.0
├── README.md               # Project documentation (this file)
├── djangotutorial/         # Django polls application
│   ├── db.sqlite3          # SQLite database
│   ├── manage.py           # Django management script
│   ├── start.sh            # Startup script
│   ├── mysite/            # Django project configuration
│   │   ├── settings.py
│   │   ├── urls.py
│   │   └── wsgi.py
│   └── polls/             # Django polls app
│       ├── models.py
│       ├── views.py
│       ├── urls.py
│       ├── admin.py
│       ├── apps.py
│       ├── tests.py
│       └── templates/
├── deployment/             # Kubernetes manifests
│   ├── config.yaml        # ConfigMap
│   ├── pod.yaml          # Pod specification
│   ├── pvc.yaml          # Persistent Volume Claim
│   ├── secret.yaml       # Secret configuration
│   └── service.yaml      # Service definition
└── K9s/                   # K9s Kubernetes CLI tool
    └── usr/bin/k9s
```

## Components

### Flask Application

**File**: `app.py`

A minimal Flask web application demonstrating cookie-based user authentication.

**Features**:
- Cookie-based user sessions
- Dynamic routing with username parameters
- Simple welcome messages

**Local Development**:
```bash
# Install dependencies
pip install flask

# Run the application
python app.py
```

Access at: `http://localhost:5000`

### Django Polls Application

**Directory**: `djangotutorial/`

A complete Django web application implementing the official Django tutorial's polls system.

**Features**:
- Question and choice voting system
- Admin interface for content management
- Database-backed persistence
- Template-based rendering

**Local Development**:
```bash
cd djangotutorial

# Install dependencies
pip install django

# Set up database
python manage.py migrate

# Create admin user (optional)
python manage.py createsuperuser

# Run development server
python manage.py runserver
```

Access at: `http://localhost:8000`

Admin interface: `http://localhost:8000/admin`

### Docker Containerization

**File**: `Dockerfile`

The Django application is containerized using Docker with Python 3.12.3 and Django 6.0.1.

**Build and Run**:
```bash
# Build the Docker image
docker build -t cis-92 .

# Run the container
docker run -p 8080:8080 cis-92
```

The application will be available at `http://localhost:8080`.

### Kubernetes Deployment

**Directory**: `deployment/`

Complete Kubernetes manifests for deploying the Django application to a cluster.

**Manifests**:
- **pod.yaml**: Application pod with resource limits and volume mounts
- **service.yaml**: LoadBalancer service exposing port 80 → 8080
- **pvc.yaml**: Persistent volume claim for database storage
- **config.yaml**: ConfigMap for environment variables
- **secret.yaml**: Secret for sensitive configuration

**Deployment**:
```bash
# Apply all manifests
kubectl apply -f deployment/

# Check deployment status
kubectl get pods
kubectl get services
```

The application will be accessible via the LoadBalancer's external IP on port 80.

### K9s Cluster Management

**Directory**: `K9s/`

K9s is included as a standalone binary for Kubernetes cluster management and monitoring.

**Usage**:
```bash
./K9s/usr/bin/k9s
```

## Environment Configuration

The Django application uses the following environment variables:

| Variable | Description | Default |
|----------|-------------|---------|
| `SECRET_KEY` | Django secret key | `fixme-12345` |
| `DEBUG` | Enable Django debug mode | `1` |
| `PORT` | Application port | `8080` |
| `STUDENT_NAME` | Student identifier | `"No Name"` |
| `SITE_NAME` | Site domain | `"www.cis-92.com"` |
| `DATA_DIR` | Data directory path | `"/data"` |

## Requirements

- **Python**: 3.12.3+
- **Django**: 6.0.1
- **Flask**: Latest
- **Docker**: For containerization
- **Kubernetes**: For cluster deployment

## Development Setup

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd cis-92
   ```

2. **Set up Python environment**
   ```bash
   python -m venv .venv
   source .venv/bin/activate  # On Windows: .venv\Scripts\activate
   pip install django flask
   ```

3. **Run Flask application**
   ```bash
   python app.py
   ```

4. **Run Django application**
   ```bash
   cd djangotutorial
   python manage.py migrate
   python manage.py runserver
   ```

5. **Containerized deployment**
   ```bash
   docker build -t cis-92 .
   docker run -p 8080:8080 cis-92
   ```

6. **Kubernetes deployment**
   ```bash
   kubectl apply -f deployment/
   ```

## Contributing

This is a course project for CIS-92. For questions or improvements, please refer to the course materials or contact the instructor.

## License

Licensed under the Apache License 2.0. See [LICENSE](LICENSE) for details.
# Deployment Instructions

This document outlines how to deploy and configure the arbitrage web application.

## Progressive Web App (PWA)

The PWA front‑end for this project will be hosted at the following URL:

* **PWA URL**: https://dynerto.com/arbitrage

To enable the PWA to interact with the backend and PythonAnywhere, expose the `PWA_URL` environment variable in your application. For example, in Python you might use `os.getenv('PWA_URL')` to refer to this value.

## PythonAnywhere Hosting

The backend API is intended to run on PythonAnywhere. Please use the provided account or create your own.

* **PythonAnywhere account username**: `mtev`
* The password should be provided via environment variable or secret; **do not check it into the code repository**.

### Environment variables

Create a `.env` file in the project root and define the following variables (this file should **NOT** be committed to version control):

```
PWA_URL=https://dynerto.com/arbitrage
PYTHONANYWHERE_USERNAME=mtev
PYTHONANYWHERE_PASSWORD=your_password_here  # replace with the real password
```

The `.env.example` file in this repository shows the variable names without actual secrets. Use it as a template.

### Deployment steps

1. Copy `.env.example` to `.env` and fill in the real values for the environment variables above.
2. Sign into your PythonAnywhere account and create a new web app pointing to your project's WSGI entry point.
3. Install the required dependencies (e.g., create a virtual environment and install from `requirements.txt`).
4. In the PythonAnywhere web app configuration page, set the environment variables listed above under the "Environment variables" section.
5. Deploy and reload your web app.

These instructions should give the virtual agent team the information needed to integrate the PWA and PythonAnywhere hosting without exposing secrets.

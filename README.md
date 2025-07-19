
# Deploy Phi-4-Mini with Ollama using Docker + GitHub Actions

This project demonstrates how to deploy [Phi-4-Mini](https://huggingface.co/microsoft/Phi-4-mini), a powerful and efficient open-source language model from Microsoft, using [Ollama](https://ollama.com) inside a Docker container — with **automated CI/CD deployment via GitHub Actions**.


## 🚀 Features

- 🔁 **Fully automated CI/CD pipeline** using GitHub Actions
- 🐳 **Dockerized Ollama runtime** with `phi:4-mini` pre-pulled
- 🔐 **Secrets-based remote deployment** using SSH
- 🌍 **Local or remote LLM inference API** on port `11434`


## 📁 Project Structure

```bash
.
├── Dockerfile                # Builds a Docker image with phi-4-mini and Ollama
└── .github
    └── workflows
        └── deploy.yml        # GitHub Actions workflow
````


## 🧪 Quick Test (after deployment)

```bash
curl http://<server-ip>:11434/api/generate -d '{
  "model": "phi:4-mini",
  "prompt": "What is the capital of Canada?"
}'
```

## 🔐 GitHub Repository Secrets

To enable deployment via GitHub Actions, add the following secrets to repo under **Settings → Secrets → Actions**:

| Name       | Description                          |
| ---------- | ------------------------------------ |
| `SSH_HOST` | Public IP or domain of server   |
| `SSH_USER` | SSH username       |
| `SSH_KEY`  | Private SSH key  |

> To generate a key:
> `ssh-keygen -t rsa -b 4096 -C "email@example.com"`
> Then add the **public key** (`.pub`) to server’s `~/.ssh/authorized_keys`
> And the **private key** (raw contents of `id_rsa`) as the GitHub secret `SSH_KEY`


## 🛠️ How It Works

1. You push to the `main` branch.
2. GitHub Actions:

   * Builds the Docker image (`ollama-phi4`)
   * Saves the image as a `.tar` file
   * Transfers it to server using SCP
   * Runs the container on the server using Docker

Once deployed, Ollama will serve `phi-4-mini` on `http://<server-ip>:11434`.


## ✅ Requirements

* Docker installed on your server
* Port `11434` open
* GitHub repository with secrets configured

---

## 📌 Why Phi-4-Mini?

* Small footprint, big performance
* Fast startup with Ollama runtime
* No external dependencies or billing
* Perfect for private AI tools, chatbots, or dev workflows

<h1 style="text-align: center;">🚀 Pedido Veloz — Cloud DevOps Project</h1>


Projeto prático de **Cloud DevOps** demonstrando a construção, orquestração e entrega contínua de uma aplicação baseada em **microserviços**, utilizando **Docker**, **Kubernetes**, **CI/CD** e **Infraestrutura como Código (Terraform)**. Projeto com foco no desenvolvimento do trabalho da faculdade **UniFecaf**.

![Status](https://img.shields.io/badge/projeto-conclu%C3%ADdo-brightgreen?style=flat)


## 📌 Visão Geral da Arquitetura

A aplicação é composta por:

- **Gateway (Nginx)** – Porta de entrada da aplicação
- **Orders Service (FastAPI)**
- **Payments Service (FastAPI)**
- **Inventory Service (FastAPI)**
- **PostgreSQL** – Banco de dados
- **Docker Compose** – Ambiente local
- **Kubernetes** – Orquestração
- **GitHub Actions** – CI/CD
- **Terraform (AWS)** – Infraestrutura como Código (ECR)


## 🛠️ Tecnologias Utilizadas

![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat&logo=docker&logoColor=white)
![Docker Compose](https://img.shields.io/badge/Docker_Compose-2496ED?style=flat&logo=docker&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=flat&logo=kubernetes&logoColor=white)
![Nginx](https://img.shields.io/badge/Nginx-009639?style=flat&logo=nginx&logoColor=white)
![FastAPI](https://img.shields.io/badge/FastAPI-009688?style=flat&logo=fastapi&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=flat&logo=postgresql&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=flat&logo=github-actions&logoColor=white)
![GHCR](https://img.shields.io/badge/GHCR-181717?style=flat&logo=github&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=flat&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-232F3E?style=flat&logo=amazonaws&logoColor=white)


## 📂 Estrutura do Projeto

```text
.github/
 └── workflows/
apps/
 ├── gateway/
 ├── inventory/
 ├── orders/
 └── payments/
infra/
 ├── compose/
 ├── k8s/
 │   └── base/
 └── terraform/
```

## ▶️ Teste com Docker Compose (Ambiente Local)

### Pré-requisitos

* Docker
* Docker Compose

**Subir Aplicação:**
- docker compose -f infra/compose/docker-compose.yml up -d --build

**Teste:**

- curl http://localhost:8080/
- curl http://localhost:8080/orders/health
- curl http://localhost:8080/payments/health
- curl http://localhost:8080/inventory/health

**Observação: caso utilize portas diferentes, ajuste conforme necessário.**

## ☸️ Kubernetes (Docker Desktop)

### Pré-requisitos

* Kubernetes habilitado no Docker Desktop
* kubectl instalado

**Criar Namespace:**
- kubectl apply -f infra/k8s/base/namespace.yaml

**Recursos:**

Rode esses comandos para garantir que o projeto irá funcionar.

- kubectl apply -f infra/k8s/base/configmap.yaml
- kubectl apply -f infra/k8s/base/secret.yaml
- kubectl apply -f infra/k8s/base/postgres-pvc.yaml
- kubectl apply -f infra/k8s/base/postgres-deployment.yaml
- kubectl apply -f infra/k8s/base/postgres-service.yaml

### Microserviços:

**Orders**

- kubectl apply -f infra/k8s/base/orders-deployment.yaml
- kubectl apply -f infra/k8s/base/orders-service.yaml

**Payments**

- kubectl apply -f infra/k8s/base/payments-deployment.yaml
- kubectl apply -f infra/k8s/base/payments-service.yaml

**Inventory**

- kubectl apply -f infra/k8s/base/inventory-deployment.yaml
- kubectl apply -f infra/k8s/base/inventory-service.yaml

**Gateway:**

- kubectl apply -f infra/k8s/base/gateway-configmap.yaml
- kubectl apply -f infra/k8s/base/gateway-deployment.yaml
- kubectl apply -f infra/k8s/base/gateway-service.yaml

**Testes:**

- curl http://localhost:30080/orders/health
- curl http://localhost:30080/payments/health
- curl http://localhost:30080/inventory/health

**Observação: caso utilize portas diferentes, ajuste conforme necessário.**

## 🔍 Observabilidade 

**Analisar os Logs:**

- kubectl -n pedidos-veloz logs deploy/orders
- kubectl -n pedidos-veloz logs deploy/gateway

**Health Checks:**

- GET /health

## 🔄 CI/CD — GitHub Actions

**O pipeline executa alguns testes de forma automática:**

- Testes básicos 
- Build das imagens Docker

Está no caminho: **.github/workflows/ci-cd.yml**

## 🏗️ Terraform

Apenas um esqueleto, repositório ECR para microserviços.

**Validação:**

- terraform init
- terraform validate

## Link para explicação do projeto no  <img width="20" height="20" alt="image" src="https://github.com/user-attachments/assets/05f2c755-f126-4a68-931b-6559aedcf8be" /> Youtube

https://youtu.be/51q-shV_CIA

### Licença 


Este projeto está licenciado sob a Licença MIT — veja o arquivo [LICENSE](LICENSE) para detalhes.

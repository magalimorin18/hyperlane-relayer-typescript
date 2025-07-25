# Hyperlane LUKSO Testnet Relayer

> A TypeScript implementation of the Hyperlane relayer for LUKSO testnet, running on Google Cloud Platform.

## 📋 Prerequisites

Before you begin, ensure you have:

- [ ] Google Cloud SDK installed and configured
- [ ] Access to the `lukso-infrastructure-dev` project
- [ ] A valid relayer private key funded with LYXt and Sepolia ETH

## 🚀 Quick Start

### Connect to the VM

SSH into the Google Cloud VM:

```bash
gcloud compute ssh \
  --zone "europe-west10-a" \
  "hyperlane-lukso-testnet-relayer" \
  --project "lukso-infrastructure-dev"
```

### Setup Repository (On VM)

Clone the hyperlane agents repository:

```bash
git clone https://github.com/magalimorin18/hyperlane-relayer-typescript.git
cd hyperlane-relayer-typescript
```

### Build Docker Image

Build the Docker image with the relayer:

```bash
docker build -t hyperlane-relayer .
```

### Run Container

```bash
# ⚠️ Add the relayer private key to the command
docker run --restart=unless-stopped -e HYP_KEY=INPUT_HYP_KEY -d hyperlane-relayer

```

## 🔧 Configuration

### Environment Variables

| Variable  | Description                         | Required |
| --------- | ----------------------------------- | -------- |
| `HYP_KEY` | Private key for the relayer account | ✅ Yes   |

This key needs to have funds on LUKSO Testnet and on Sepolia.

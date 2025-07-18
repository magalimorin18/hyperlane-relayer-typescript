if [ ! -d "local-registry" ]; then
    echo "📂 Creating local-registry/ directory (for luksotestnet fix)..."
    mkdir local-registry
else
    echo "📁 local-registry/ directory (with luksotestnet fix) already exists, skipping creation."
fi

# Always get the latest Hyperlane registry from the npm package to be up to date
echo "📦 Copying Hyperlane registry from node_modules to local-registry..."
cp -r node_modules/@hyperlane-xyz/registry/dist/* local-registry

# Fix the chain luksotestnet in the registry
echo "🩹 Fixing luksotestnet/ chains entry with missing addresses..."
rm -rf local-registry/chains/luksotestnet
cp -r luksotestnet local-registry/chains

# Run the relayer
echo "🔀 Run the Hyperlane Typescript relayer. Let's go!"
source .env
bun run hyperlane relayer \
    --registry ./local-registry \
    --chains luksotestnet,sepolia
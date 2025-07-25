FROM oven/bun
WORKDIR /app
COPY /luksotestnet /app/luksotestnet
COPY run-relayer.sh /app/run-relayer.sh
COPY bun.lockb /app/bun.lockb
COPY package.json /app/package.json
RUN chmod +x /app/run-relayer.sh
CMD bun install && bun run relayer:testnet

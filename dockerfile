FROM oven/bun
WORKDIR /app
COPY /luksotestnet /luksotestnet
COPY run-relayer.sh /run-relayer.sh
COPY bun.lockb /bun.lockb
COPY package.json /package.json
RUN chmod +x /run-relayer.sh
CMD bun install && bun run relayer:testnet

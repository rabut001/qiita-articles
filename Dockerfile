FROM node:22-slim

WORKDIR /workspace

# node_modules 用ボリュームの所有者を node ユーザーにするため、先に作成しておく
RUN mkdir -p /workspace/node_modules /home/node/.config/qiita-cli \
    && chown -R node:node /workspace /home/node/.config

USER node

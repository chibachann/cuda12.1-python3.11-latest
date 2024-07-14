FROM nvcr.io/nvidia/cuda:12.1.1-runtime-ubuntu22.04

# 環境変数の設定
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

# 必要なパッケージのインストール
RUN apt-get update && apt-get install -y \
    python3.11 \
    python3.11-dev \
    python3.11-distutils \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Python 3.11をデフォルトに設定
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1
RUN update-alternatives --set python3 /usr/bin/python3.11

# pipのアップグレードと必要なパッケージのインストール
RUN python3 -m pip install --upgrade pip setuptools wheel

# 作業ディレクトリの設定
WORKDIR /app

# エントリーポイントの設定
CMD ["/bin/bash"]

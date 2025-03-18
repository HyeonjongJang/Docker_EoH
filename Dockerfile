FROM python:3.8-slim

# 작업 디렉터리 설정
WORKDIR /app

# 시스템 의존성(예: curl, graphviz) 설치
RUN apt-get update && apt-get install -y \
    curl \
    graphviz \
    && rm -rf /var/lib/apt/lists/*

# 필요한 Python 패키지 설치 (중복 없이 한 번에 설치)
RUN pip install --no-cache-dir \
    opencv-python-headless \
    scikit-learn \
    seaborn \
    scikit-image \
    tensorboard \
    hiddenlayer \
    torchviz \
    tqdm \
    torchsummary \
    torchvision \
    linformer \
    vit-pytorch \
    einops \
    timm \
    h5py \
    efficientnet-pytorch \
    coca-pytorch \
    "vit-pytorch>=0.40.2" \
    transformers \
    accelerate \
    ipywidgets \
    jupyter

# Ollama 설치
RUN curl -fsSL https://ollama.com/install.sh | sh

# EoH 프로젝트 클론 후 설치 (setup.py가 있는 디렉터리 기준)
RUN git clone https://github.com/FeiLiu36/EoH.git && \
    cd EoH/eoh && \
    pip install .

# (선택) 컨테이너 실행 시 확인용 명령어 실행: eoh 패키지가 정상 설치되었는지 출력
CMD ["python", "-c", "import eoh; print('EoH installed successfully!')"]

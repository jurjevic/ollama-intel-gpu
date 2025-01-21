FROM intelanalytics/ipex-llm-inference-cpp-xpu:latest

ENV ZES_ENABLE_SYSMAN=1
ENV OLLAMA_HOST=0.0.0.0:11434
ENV no_proxy=localhost,127.0.0.1

RUN mkdir -p /llm/ollama; \
    cd /llm/ollama; \
    init-ollama;

WORKDIR /llm/ollama

ENTRYPOINT ["./ollama", "serve"]

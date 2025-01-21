FROM intelanalytics/ipex-llm-inference-cpp-xpu:latest

# Define variables
ENV ZES_ENABLE_SYSMAN=1
ENV OLLAMA_HOST=0.0.0.0:11434
ENV no_proxy=localhost,127.0.0.1
ENV OLLAMA_LLM_LIBRARY=cpu_avx2

# Prepare ollama
RUN mkdir -p /llm/ollama; \
    cd /llm/ollama; \
    init-ollama;

WORKDIR /llm/ollama

# Expose port
EXPOSE 11434

# Start
ENTRYPOINT ["./ollama", "serve"]

# Dockerfile
FROM ollama/ollama

# Pull phi-4-mini model when building
RUN ollama pull phi4-mini

# Expose the default Ollama port
EXPOSE 11434

# Run Ollama
CMD ["ollama", "serve"]

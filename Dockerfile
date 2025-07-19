FROM ollama/ollama

COPY ./run-ollama.sh /usr/local/bin/run-ollama.sh
RUN chmod +x /usr/local/bin/run-ollama.sh \
  && /usr/local/bin/run-ollama.sh

EXPOSE 11434

CMD ["ollama", "serve"]

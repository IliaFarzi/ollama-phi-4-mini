#!/usr/bin/env bash
set -e

echo "Starting Ollama in background..."
ollama serve &

# Wait until the server is actually up
sleep 5

echo "⬇Pulling phi-4-mini model..."
ollama pull phi4-mini

echo "Model downloaded"

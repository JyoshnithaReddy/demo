#!/bin/bash

echo "Starting project setup..."

# 1. Create the folder structure mentioned in Task 3
echo "Creating directory structure..."
mkdir -p docs diagrams logs src

# 2. Create a virtual environment (keeps your computer clean)
echo "Setting up virtual environment (venv)..."
python3 -m venv venv
source venv/bin/activate

# 3. Install the basic requirements
if [ -f requirements.txt ]; then
    echo "Installing basic dependencies from requirements.txt..."
    pip install --upgrade pip
    pip install -r requirements.txt
else
    echo "Warning: requirements.txt not found. Skipping installation."
fi

# 4. Create a dummy log file to test with
echo "Creating a sample log file in logs/test.log..."
echo "INFO 2026-02-17 10:00:01 System started" > logs/test.log
echo "ERROR 2026-02-17 10:05:22 Database connection failed" >> logs/test.log

echo "Setup complete! To start, run: source venv/bin/activate"
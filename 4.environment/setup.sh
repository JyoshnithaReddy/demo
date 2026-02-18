#!/bin/bash
# ==============================================================
# Setup Script - High-Throughput Log Analytics & Monitoring Engine
# Installs and configures Dask and Ray
# ==============================================================

set -e  # Exit on error

echo "=============================================="
echo "  Setting Up Log Analytics Environment"
echo "=============================================="

# ── Step 1: Check Python version ──────────────────────────────
echo ""
echo "[1/5] Checking Python version..."
python_version=$(python3 --version 2>&1)
echo "  Found: $python_version"

REQUIRED_MAJOR=3
REQUIRED_MINOR=9
actual_minor=$(python3 -c "import sys; print(sys.version_info.minor)")
actual_major=$(python3 -c "import sys; print(sys.version_info.major)")

if [ "$actual_major" -lt "$REQUIRED_MAJOR" ] || [ "$actual_minor" -lt "$REQUIRED_MINOR" ]; then
    echo "  ERROR: Python $REQUIRED_MAJOR.$REQUIRED_MINOR+ is required."
    exit 1
fi
echo "  Python version OK."

# ── Step 2: Create virtual environment ────────────────────────
echo ""
echo "[2/5] Creating virtual environment..."
if [ ! -d ".venv" ]; then
    python3 -m venv .venv
    echo "  Virtual environment created at .venv/"
else
    echo "  Virtual environment already exists, skipping."
fi

# Activate virtual environment
source .venv/bin/activate
echo "  Activated virtual environment."

# ── Step 3: Upgrade pip ───────────────────────────────────────
echo ""
echo "[3/5] Upgrading pip..."
pip install --upgrade pip --quiet
echo "  pip upgraded."

# ── Step 4: Install dependencies ──────────────────────────────
echo ""
echo "[4/5] Installing dependencies from requirements.txt..."
pip install -r environment/requirements.txt --quiet
echo "  All dependencies installed."

# ── Step 5: Verify Dask and Ray ───────────────────────────────
echo ""
echo "[5/5] Verifying Dask and Ray installations..."

python3 -c "
import dask
import ray
print(f'  ✓ Dask version  : {dask.__version__}')
print(f'  ✓ Ray version   : {ray.__version__}')
"

echo ""
echo "=============================================="
echo "  Setup Complete!"
echo "  Run tests: pytest tests/test_environment.py"
echo "  See README_SETUP.md for more details."
echo "=============================================="

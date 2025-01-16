#!/bin/bash
# Add Anaconda to PATH
echo 'export PATH=/opt/conda/bin:$PATH' >> /config/.bashrc
# Ensure the script doesn't exit immediately
tail -f /dev/null
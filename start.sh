#!/bin/bash

echo "🚀 DRX POWER SYSTEM STARTING..."

# 1. Libraries install karega
echo "📦 Installing Python libraries..."
pip install flask telebot requests psutil --quiet

# 2. C Binary compile karega
echo "⚙️ Compiling drx.c binary..."
gcc drx.c -o drx -lpthread -O3
chmod +x drx

# 3. Purane sessions band karega
echo "✅ Cleaning old sessions..."
pkill -f api.py
pkill -f drx.py

# 4. API background mein start karega
echo "🌐 Starting Flask API on port 8080..."
python3 api.py > api_logs.txt 2>&1 &
sleep 2

# 5. Telegram Bot foreground mein start karega
echo "🤖 Starting Telegram Bot..."
python3 drx.py

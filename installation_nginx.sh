#!/bin/bash

# ==========================================================
# Project: Static Website Hosting Automation
# Author: Jigyasa
# Date: 2026-02-22
# ==========================================================

# 1. System Update
echo "Updating system packages..."
sudo apt update -y

# 2. Nginx Installation
echo "Installing Nginx..."
sudo apt install nginx -y

# 3. Nginx Service Start and Enable
echo "Starting Nginx service..."
sudo systemctl start nginx
sudo systemctl enable nginx

# 4. Creating a custom HTML file
echo "Deploying custom HTML page..."
cat <<EOF > index.html
<!DOCTYPE html>
<html>
<head>
    <title>Cloud Journey | Day 2</title>
    <style>
        body { font-family: sans-serif; background: #f4f7f6; text-align: center; padding: 50px; }
        .box { background: white; padding: 20px; border-radius: 10px; box-shadow: 0 5px 15px rgba(0,0,0,0.1); display: inline-block; }
        h1 { color: #232f3e; }
        .status { color: #28a745; font-weight: bold; }
    </style>
</head>
<body>
    <div class="box">
        <h1>☁️ AWS Cloud Project: Day 2</h1>
        <p>This website was deployed using an <b>Automation Script</b>.</p>
        <p class="status">Server Status: Online ✅</p>
        <hr>
        <p>Managed by Jigyasa | 2026</p>
    </div>
</body>
</html>
EOF

# 5. Moving file to Nginx Web Root
sudo cp index.html /var/www/html/index.html

# 6. Final Verification
echo "Deployment Complete! Checking server status..."
curl -I localhost
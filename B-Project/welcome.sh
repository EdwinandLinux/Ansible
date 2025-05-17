#!/bin/bash
# Generate an index.html page in Apache's web root
sudo cat <<EOF> /var/www/html/index.html 
<html>
<head>
<title>
Welcome!!!
</title>
<body>
<h1>Welcome to Apache2!!!!!!</body>
</body>
</head>
</html>
EOF

# Ensure proper permission
sudo chmod 644 /var/www/html/index.html
                    
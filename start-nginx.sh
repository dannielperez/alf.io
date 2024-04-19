#!/bin/sh

# Loop until the certificate file is found or we've tried 5 times
for i in $(seq 1 5); do
    if [ -f /etc/letsencrypt/live/entrame.vip/fullchain.pem ]; then
        # If the certificate file is found, start Nginx and break the loop
        exec nginx -g 'daemon off;'
    else
        # If the certificate file is not found, wait for 5 seconds and try again
        echo "Certificate not ready yet, waiting for 5 seconds..."
        sleep 5
    fi
done

# If the certificate file is not found after 5 tries, print an error message and exit
echo "Certificate file not found, exiting..."
exit 1
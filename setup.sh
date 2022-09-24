# Install bundle dependencies

echo "Entering Admin API"
cd admin/service && npm ci

echo "Entering Client API"
cd ../../client/service && npm ci

echo "Entering Messaging API"
cd ../../messaging/service && npm ci

echo "Entering Notifications API"
cd ../../notifications/service && npm ci

echo "Entering Payments API"
cd ../../payments/service && npm ci

echo "Entering Provider API"
cd ../../provider/service && npm ci

echo "Entering Video API"
cd ../../video/service && npm ci
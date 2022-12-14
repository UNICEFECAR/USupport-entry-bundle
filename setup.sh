# Make sure all submodules are on development branch
git submodule foreach git checkout development

# Install bundle dependencies
echo "Entering Admin API"
cd admin/service && npm ci

echo "Entering Client API"
cd ../../client/service && npm ci

echo "Entering User API"
cd ../../user/service && npm ci

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

echo "Entering Email API"
cd ../../email/service && npm ci

echo "Entering API Gateway"
cd ../../gateway && npm ci

echo "Entering Website UI"
cd ../website && npm ci
git submodule init
git submodule update

cd ..
echo "Setup completed..."

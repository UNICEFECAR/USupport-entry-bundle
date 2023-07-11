# Make sure all submodules are on development branch
git submodule foreach git checkout development

# Install bundle dependencies
echo "Entering Admin API"
cd admin/service && cp .env.sample .env.local && npm ci

echo "Entering Client API"
cd ../../client/service && cp .env.sample .env.local && npm ci

echo "Entering User API"
cd ../../user/service && cp .env.sample .env.local && npm ci

echo "Entering Messaging API"
cd ../../messaging/service && cp .env.sample .env.local && npm ci

echo "Entering Notifications API"
cd ../../notifications/service && cp .env.sample .env.local && npm ci

echo "Entering Payments API"
cd ../../payments/service && cp .env.sample .env.local && npm ci

echo "Entering Provider API"
cd ../../provider/service && cp .env.sample .env.local && npm ci

echo "Entering Video API"
cd ../../video/service && cp .env.sample .env.local && npm ci

echo "Entering Email API"
cd ../../email/service && cp .env.sample .env.local && npm ci

echo "Entering API Gateway"
cd ../../gateway && cp .env.sample .env.local && npm ci

echo "Entering Website UI"
cd ../website && npm ci

echo "Entering Country Admin UI"
cd ../admin-country-ui && npm ci

echo "Entering Global Admin UI"
cd ../admin-global-ui && npm ci

echo "Entering Provider UI"
cd ../provider-ui && npm ci

echo "Entering Client UI"
cd ../client-ui && npm ci

git submodule init
git submodule update

cd ..
echo "Setup completed..."

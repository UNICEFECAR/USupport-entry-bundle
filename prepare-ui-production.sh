# pull each ui from staging branch
echo "Pulling each ui from staging branch"
cd client-ui
git pull origin staging
cd ../provider-ui
git pull origin staging
cd ../website
git pull origin staging
cd ../admin-global-ui
git pull origin staging
cd ../admin-country-ui
git pull origin staging

# pull the components library for each ui
echo "Pulling the components library for each ui"
cd ../client-ui/USupport-components-library
git pull origin staging
cd ../../provider-ui/USupport-components-library
git pull origin staging
cd ../../website/USupport-components-library
git pull origin staging
cd ../../admin-global-ui/USupport-components-library
git pull origin staging
cd ../../admin-country-ui/USupport-components-library
git pull origin staging

# install each components library
echo "Installing each components library"
cd ../../client-ui/USupport-components-library
npm install
cd ../../provider-ui/USupport-components-library
npm install
cd ../../website/USupport-components-library
npm install
cd ../../admin-global-ui/USupport-components-library
npm install
cd ../../admin-country-ui/USupport-components-library
npm install

# install each ui
echo "Installing each ui"
cd ../../client-ui
npm install
cd ../provider-ui
npm install
cd ../website
npm install
cd ../admin-global-ui
npm install
cd ../admin-country-ui
npm install

# build each ui
echo "Building each ui"
cd ../client-ui
npm run build --prod
cd ../provider-ui
npm run build --prod
cd ../website
npm run build --prod
cd ../admin-global-ui
npm run build --prod
cd ../admin-country-ui
npm run build --prod

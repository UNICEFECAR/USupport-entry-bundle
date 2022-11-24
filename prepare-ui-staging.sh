# pull each ui from development branch
echo "Pulling each ui from development branch"
cd client-ui
git pull origin development
cd ../provider-ui
git pull origin development
cd ../website
git pull origin development
cd ../admin-global-ui
git pull origin development
cd ../admin-country-ui
git pull origin development

# pull the components library for each ui
echo "Pulling the components library for each ui"
cd ../client-ui/USupport-components-library
git pull origin development
cd ../../provider-ui/USupport-components-library
git pull origin development
cd ../../website/USupport-components-library
git pull origin development
cd ../../admin-global-ui/USupport-components-library
git pull origin development
cd ../../admin-country-ui/USupport-components-library
git pull origin development

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
npm run staging
cd ../provider-ui
npm run staging
cd ../website
npm run staging
cd ../admin-global-ui
npm run staging
cd ../admin-country-ui
npm run staging

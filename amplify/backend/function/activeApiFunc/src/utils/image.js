const DynamicApi = require('./../api/dynamicApi');
const zip = require('zip-array');

module.exports = async (base64Image, data) => {
  const currentService = 'searchImage';
  const extractedActiveProviders = data.activeProviders;

  const providers = extractedActiveProviders
    .map((p) => {
      if (p in data) {
        const activeApi = data[p].activeApi.imageSearch;
        if (activeApi in data[p]) {
          if (data[p][activeApi][currentService].active === true) {
            return {
              slug: data[p].slug,
              apiKey: data[p][activeApi].apiKey,
              searchConfig: data[p][activeApi][currentService],
              uploadConfig: data[p][activeApi]['imageUpload'],
              selfSearch: data[p][activeApi]['imageSearch'].selfSearch,
              priceFormula: eval(
                data.priceFormula[data[p][activeApi][currentService]['price']]
              ),
            };
          }
        }
      }
    })
    .filter(Boolean);

  const awaitingUploadRequests = [];
  let uploadResult = [];
  const awaitingImageSearchRequests = [];

  providers.forEach((p) => {
    if (!p.selfSearch) {
      const activeProvider = new DynamicApi(
        p.uploadConfig,
        p.apiKey,
        p.slug,
        p.priceFormula
      );
      awaitingUploadRequests.push(activeProvider.imageUpload(base64Image));
    } else {
      awaitingUploadRequests.push(base64Image);
    }
  });

  if (awaitingUploadRequests.length) {
    uploadResult = await Promise.all(awaitingUploadRequests);
  }

  providers.forEach((p, i) => {
    const activeProvider = new DynamicApi(
      p.searchConfig,
      p.apiKey,
      p.slug,
      p.priceFormula
    );
    awaitingImageSearchRequests.push(
      activeProvider.imageSearch(uploadResult[i].uploadKey)
    );
  });

  const results = await Promise.all(awaitingImageSearchRequests);

  let products = [];
  let totalProducts = 0;
  results.forEach((re) => {
    if (!re.error) {
      products.push(re.products);
      totalProducts = totalProducts + parseInt(re.totalProducts);
    }
  });

  if (products.length) {
    const allProductsZipped = zip.zip_longest(...products);
    const makeOneArray = [].concat(...allProductsZipped);

    const removedUndefined = makeOneArray.filter((e) => e);
    products = removedUndefined;
  }

  return {
    products: products,
    totalProducts: totalProducts,
  };
};

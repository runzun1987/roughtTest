const zip = require('zip-array');
const DynamicApi = require('./../api/dynamicApi');

module.exports = async (kw, pageNum, kachuwaProviderAndApis) => {
  const currentService = 'keyword';
  const extractedActiveProviders = kachuwaProviderAndApis.activeProviders;
  const providers = extractedActiveProviders.map((p) => {
    if (p in kachuwaProviderAndApis) {
      const activeApi = kachuwaProviderAndApis[p].activeApi.keyword;
      if (activeApi in kachuwaProviderAndApis[p]) {
        return {
          slug: kachuwaProviderAndApis[p].slug,
          apiKey: kachuwaProviderAndApis[p][activeApi].apiKey,
          config: kachuwaProviderAndApis[p][activeApi][currentService],
          priceFormula: eval(
            kachuwaProviderAndApis.priceFormula[
              kachuwaProviderAndApis[p][activeApi][currentService]['price']
            ]
          ),
        };
      }
    }
  });

  const awaitingRequests = [];

  providers.forEach((p) => {
    const activeProvider = new DynamicApi(
      p.config,
      p.apiKey,
      p.slug,
      p.priceFormula
    );

    awaitingRequests.push(activeProvider.keyword(kw, pageNum));
  });

  const results = await Promise.all(awaitingRequests);

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
    page: pageNum,
    products: products,
    searchedKeyword: kw,
    totalProducts: totalProducts,
  };
};

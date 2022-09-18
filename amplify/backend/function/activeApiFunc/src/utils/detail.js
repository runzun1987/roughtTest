const DynamicApi = require('./../api/dynamicApi');

module.exports = async (linkId, kachuwaProviderAndApis) => {
  const currentService = 'productDetail';
  const extractedActiveProviders = kachuwaProviderAndApis.activeProviders;

  const providers = extractedActiveProviders.map((p) => {
    if (p in kachuwaProviderAndApis) {
      const activeApi = kachuwaProviderAndApis[p].activeApi.detail;
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

  const linkIdSplit = linkId.split('-');

  const productId = linkIdSplit[0];

  let productSlug = 'zx';
  if (linkIdSplit.length > 1) {
    productSlug = linkIdSplit[1];
  }

  const selectedProvider = providers.find((p) => p.slug === productSlug);

  const activeProvider = new DynamicApi(
    selectedProvider.config,
    selectedProvider.apiKey,
    selectedProvider.slug,
    selectedProvider.priceFormula
  );

  return activeProvider.productDetail(productId);
};

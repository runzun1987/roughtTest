module.exports = (result, dataOptions, slug, priceFormula) => {
  const cleanAfterTags = (input) => {
    return input
      .split(';')
      .map((section) => section.split('#')[0])
      .join(';');
  };

  const checkIfNotEmpty = (obj) => {
    if (Object.entries(obj).length === 0) {
      return false;
    }
    return true;
  };

  const data = eval(dataOptions.data);
  const bigImageUrl = eval(dataOptions.bigImageUrl);
  const smallImages = eval(dataOptions.smallImages);
  const title = eval(dataOptions.title);
  const stock = eval(dataOptions.stock);
  const categoryId = eval(dataOptions.categoryId);
  const categoryName = eval(dataOptions.categoryName);
  const price = priceFormula(eval(dataOptions.price));
  let sellerShippingPrice = priceFormula(eval(dataOptions.sellerShippingPrice));
  const description = eval(dataOptions.description);
  const skus = eval(dataOptions.skus);
  const skusProperties = eval(dataOptions.skusProperties);

  let skus_arr = [];
  if (
    skusProperties.type === 'arr'
      ? eval(skusProperties.path).length
      : checkIfNotEmpty(eval(skusProperties.path))
  ) {
    for (let sku of eval(skus.path)) {
      const cleanId = cleanAfterTags(eval(dataOptions.sku));
      const skuPrice = eval(dataOptions.skuPrice);
      skus_arr.push([
        eval(dataOptions.skuId),
        cleanId,
        priceFormula(skuPrice),
        eval(dataOptions.stock),
        priceFormula(skuPrice),
      ]);
    }
  }

  const skus_json = JSON.stringify(skus_arr);

  const innerValueArr = (mainId, innerValues, displayName) => {
    for (let innerValue of innerValues) {
      const secondaryId = eval(dataOptions.secondaryId);
      const value = eval(dataOptions.value);
      const pic = eval(dataOptions.pic);
      createObj(mainId, secondaryId, displayName, value, pic);
    }
  };

  let prop_obj = {};

  const createObj = (mainId, secondaryId, displayName, value, pic) => {
    if (!prop_obj.hasOwnProperty(mainId)) {
      prop_obj = Object.assign(
        {
          [mainId]: {
            [secondaryId]: {
              prop_key: mainId,
              prop_val: secondaryId,
              name: displayName,
              value: value,
              pic_url: pic ? pic : '',
            },
          },
        },
        prop_obj
      );
    } else {
      prop_obj[mainId] = Object.assign(
        {
          [secondaryId]: {
            prop_key: mainId,
            prop_val: secondaryId,
            name: displayName,
            value: value,
            pic_url: pic ? pic : '',
          },
        },
        prop_obj[mainId]
      );
    }
  };

  const innerValueObj = (mainId, innerValues, displayName) => {
    for (const [secondaryKey, secondaryValue] of Object.entries(innerValues)) {
      const secondaryId = eval(dataOptions.secondaryId);
      const value = eval(dataOptions.value);
      const pic = eval(dataOptions.pic);

      createObj(mainId, secondaryId, displayName, value, pic);
    }
  };

  const primarySku = (property, primaryKey, primaryValue) => {
    const mainId = eval(dataOptions.mainId);
    const innerValues = eval(dataOptions.innerValues);
  
    const displayName = eval(dataOptions.displayName);
  

    if (innerValues.type === 'arr') {
      innerValueArr(mainId, eval(innerValues.path), displayName);
    } else {
      innerValueObj(mainId, eval(innerValues.path), displayName);
    }
  };

  if (skusProperties.type === 'arr') {
    for (let property of eval(skusProperties.path)) {
      primarySku(property);
    }
  } else {
    for (const [primaryKey, primaryValue] of Object.entries(
      eval(skusProperties.path)
    )) {
      primarySku(null, primaryKey, primaryValue);
    }
  }

  const removeOtherAndMakeOne = eval(dataOptions.removeOtherAndMakeOne);

  for (let code in removeOtherAndMakeOne) {
    if (prop_obj[code]) {
      for (let val of removeOtherAndMakeOne[code].values) {
        if (prop_obj[code].hasOwnProperty(val)) {
          prop_obj = {
            ...prop_obj,
            [code]: {
              [val]: {
                ...prop_obj[code][val],
              },
            },
          };
        }
      }
    }
  }


  return {
    title,
    stock,
    price,
    sellerShippingPrice,
    description,
    prop_obj,
    skus_json,
    bigImageUrl,
    categoryId,
    categoryName,
    smallImages,
    provider: slug,
  };
};

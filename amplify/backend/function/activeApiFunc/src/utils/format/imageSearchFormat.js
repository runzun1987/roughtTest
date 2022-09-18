module.exports = (result, dataOptions, slug, priceFormula) => {
  const data = eval(dataOptions.data);
  const totalProducts = eval(dataOptions.totalProducts);
  const items = eval(dataOptions.items.replace(/\s/g, ''));

  const products = items.map((item) => {
    return {
      id: eval(dataOptions.itemId.replace(/\s/g, '')),
      name: eval(dataOptions.itemName.replace(/\s/g, '')),
      price: priceFormula(eval(dataOptions.itemPrice.replace(/\s/g, ''))),
      pictures: [eval(dataOptions.itemImageUrl.replace(/\s/g, ''))],
      provider: slug,
    };
  });

  return { products, totalProducts };
};

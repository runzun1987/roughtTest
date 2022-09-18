module.exports = (result, dataOptions, slug, priceFormula) => {
  const data = eval(dataOptions.data);
  const uploadKey = eval(dataOptions.uploadKey);

  return {
    uploadKey: uploadKey,
    slug: slug,
  };
};

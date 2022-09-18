var axios = require('axios').default;
const { base64ToBlob } = require('base64-blob');
const keywordFormat = require('./../utils/format/keywordFormat');
const detailFormat = require('./../utils/format/detailFormat');
const imageSearchFormat = require('./../utils/format/imageSearchFormat');
const imageUploadFormat = require('./../utils/format/imageUploadFormat');
const sendToS3 = require('./../utils/sendToS3');

class DynamicApi {
  constructor(config, apiKey, slug, priceFormula) {
    this.configError = config.error;
    this.configFormat = config.format;
    this.configOptions = config.options;
    this.priceFormula = priceFormula;
    this.slug = slug;
    this.KEY = apiKey;
    this.option = {
      method: this.configOptions.method,
    };
  }

  errorCheck(result, errorCheck) {
    return eval(errorCheck) ? false : true;
  }

  async keyword(kw, page) {
    const pageNum = parseInt(page);
    const urlResult = this.configOptions.url.interpolate({
      kw,
      pageNum,
      api: this.KEY,
    });

    const addKeyword = this.configOptions.add['kw'];
    const addPage = this.configOptions.add['pageNum'];
    const addApi = this.configOptions.add['this.key'];

    this.option.url = urlResult;

    if (this.configOptions.data) {
      this.option.data = this.configOptions.data;
    } else if (
      addKeyword.location == 'data' ||
      addPage.location == 'data' ||
      addApi.location == 'data'
    ) {
      this.option.data = JSON.parse('{}');
    }

    if (this.configOptions.params) {
      this.option.params = this.configOptions.params;
    } else if (
      addKeyword.location == 'params' ||
      addPage.location == 'params' ||
      addApi.location == 'params'
    ) {
      this.option.params = JSON.parse('{}');
    }

    if (this.configOptions.headers) {
      this.option.headers = this.configOptions.headers;
    } else if (
      addKeyword.location == 'headers' ||
      addPage.location == 'headers' ||
      addApi.location == 'headers'
    ) {
      this.option.headers = JSON.parse('{}');
    }

    if (addKeyword && addKeyword.location && addKeyword.location !== 'url') {
      this.option[addKeyword.location][addKeyword.name] = kw;
    }

    if (addPage && addPage.location && addPage.location !== 'url') {
      this.option[addPage.location][addPage.name] = pageNum;
    }
    if (addApi && addApi.location && addApi.location !== 'url') {
      this.option[addApi.location][addApi.name] = this.KEY;
    }

 

    try {
      const result = await axios.request(this.option);

      const error = this.errorCheck(result, this.configError.errorCheck);

      return !error
        ? {
            ...keywordFormat(
              result,
              this.configFormat,
              this.slug,
              this.priceFormula
            ),
            searchedKeyword: kw,
            page,
          }
        : { error: { message: this.configError.errorMessage } };
    } catch (err) {
      return { error: { message: err.message } };
    }
  }

  async productDetail(productId) {
    const urlResult = this.configOptions.url.interpolate({
      productId,
      api: this.KEY,
    });

    this.option.url = urlResult;

    const addProductId = this.configOptions.add['productId'];
    const addApi = this.configOptions.add['this.key'];

    if (this.configOptions.data) {
      this.option.data = this.configOptions.data;
    } else if (addProductId.location == 'data' || addApi.location == 'data') {
      this.option.data = JSON.parse('{}');
    }

    if (this.configOptions.params) {
      this.option.params = this.configOptions.params;
    } else if (
      addProductId.location == 'params' ||
      addApi.location == 'params'
    ) {
      this.option.params = JSON.parse('{}');
    }

    if (this.configOptions.headers) {
      this.option.headers = this.configOptions.headers;
    } else if (
      addProductId.location == 'headers' ||
      addApi.location == 'headers'
    ) {
      this.option.headers = JSON.parse('{}');
    }

    if (
      addProductId &&
      addProductId.location &&
      addProductId.location !== 'url'
    ) {
      this.option[addProductId.location][addProductId.name] = productId;
    }

    if (addApi && addApi.location && addApi.location !== 'url') {
      this.option[addApi.location][addApi.name] = this.KEY;
    }

    try {
      const result = await axios.request(this.option);
      const error = this.errorCheck(result, this.configError.errorCheck);

      return !error
        ? {
            ...detailFormat(
              result,
              this.configFormat,
              this.slug,
              this.priceFormula
            ),
            productId,
          }
        : { error: { message: this.configError.errorMessage } };
    } catch (err) {
      return { error: { message: err.message } };
    }
  }

  async imageSearch(uploadKey) {
    const urlResult = this.configOptions.url.interpolate({
      uploadKey,
      api: this.KEY,
    });

    this.option.url = urlResult;

    const addUploadKey = this.configOptions.add['uploadKey'];
    const addApi = this.configOptions.add['this.key'];

    if (this.configOptions.data) {
      this.option.data = this.configOptions.data;
    } else if (addUploadKey.location == 'data' || addApi.location == 'data') {
      this.option.data = JSON.parse('{}');
    }

    if (this.configOptions.params) {
      this.option.params = this.configOptions.params;
    } else if (
      addUploadKey.location == 'params' ||
      addApi.location == 'params'
    ) {
      this.option.params = JSON.parse('{}');
    }

    if (this.configOptions.headers) {
      this.option.headers = this.configOptions.headers;
    } else if (
      addUploadKey.location == 'headers' ||
      addApi.location == 'headers'
    ) {
      this.option.headers = JSON.parse('{}');
    }

    if (
      addUploadKey &&
      addUploadKey.location &&
      addUploadKey.location !== 'url'
    ) {
      this.option[addUploadKey.location][addUploadKey.name] = uploadKey;
    }

    if (addApi && addApi.location && addApi.location !== 'url') {
      this.option[addApi.location][addApi.name] = this.KEY;
    }

    try {
      const result = await axios.request(this.option);
      const error = this.errorCheck(result, this.configError.errorCheck);

      return !error
        ? imageSearchFormat(
            result,
            this.configFormat,
            this.slug,
            this.priceFormula
          )
        : { error: { message: this.configError.errorMessage } };
    } catch (err) {
      return { error: { message: err.message } };
    }
  }

  async imageUpload(base64Image) {
    const type = this.configOptions.imageConfig.imageAccepted;
    const urlResult = this.configOptions.url.interpolate({
      base64Image,
      type,
      api: this.KEY,
    });

    this.option.url = urlResult;

    let image;
    if (
      this.configOptions.imageConfig.imageAccepted === 'bolb' ||
      this.configOptions.imageConfig.imageAccepted === 'BOLB'
    ) {
      image = await base64ToBlob(image);
    } else if (this.configOptions.imageConfig.imageAccepted === 'url') {
      const bolbImage = await base64ToBlob(image);
      const fileName = `kachuwa-${Date.now()}.png`;
      await sendToS3(fileName, bolbImage);
      image = `https://kachuwa202918-kachuwa.s3.ap-southeast-1.amazonaws.com/public/${fileName}`;
    } else {
      image = base64Image;
    }

    const addType = this.configOptions.add['type'];
    const addImage = this.configOptions.add['image'];
    const addApi = this.configOptions.add['this.key'];

    if (this.configOptions.data) {
      this.option.data = this.configOptions.data;
    } else if (
      addType.location == 'data' ||
      addImage.location == 'data' ||
      addApi.location == 'data'
    ) {
      this.option.data = JSON.parse('{}');
    }

    if (this.configOptions.params) {
      this.option.params = this.configOptions.params;
    } else if (
      addType.location == 'params' ||
      addImage.location == 'params' ||
      addApi.location == 'params'
    ) {
      this.option.params = JSON.parse('{}');
    }

    if (this.configOptions.headers) {
      this.option.headers = this.configOptions.headers;
    } else if (
      addType.location == 'headers' ||
      addImage.location == 'headers' ||
      addApi.location == 'headers'
    ) {
      this.option.headers = JSON.parse('{}');
    }

    if (addType && addType.location && addType.location !== 'url') {
      this.option[addType.location][addType.name] = type;
    }

    if (addImage && addImage.location && addImage.location !== 'url') {
      this.option[addImage.location][addImage.name] = image;
    }

    if (addApi && addApi.location && addApi.location !== 'url') {
      this.option[addApi.location][addApi.name] = this.KEY;
    }

    try {
      const result = await axios.request(this.option);
      const error = this.errorCheck(result, this.configError.errorCheck);

      return !error
        ? imageUploadFormat(
            result,
            this.configFormat,
            this.slug,
            this.priceFormula
          )
        : { error: { message: this.configError.errorMessage } };
    } catch (err) {
      return { error: { message: err.message } };
    }
  }
}

module.exports = DynamicApi;

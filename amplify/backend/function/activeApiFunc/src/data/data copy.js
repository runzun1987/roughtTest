module.exports = {
  priceFormula: {
    usDollar: (pri) => {
      let rate;
      if (pri <= 8) {
        rate = 268 * (1 / Math.pow(pri, 1 / 3));
      } else if (pri <= 40) {
        rate = 134;
      } else if (pri <= 75) {
        rate = 73 * Math.pow(pri, 1 / 6);
      } else {
        rate = 150;
      }

      return Math.round(pri * rate);
    },
    chineseYuan: (pri) => {
      return Math.round(pri * 30);
    },
  },
  listOfProviders: ['aliexpress', 'taobao'],
  activeProviders: ['aliexpress'],
  aliexpress: {
    listOfApis: ['zapex', 'magic', 'rapidAliexpress'],
    activeApi: 'zapex',
    slug: 'zx',
    zapex: {
      apiKey: process.env.ZAPIEX_API_KEY,

      imageSearch: {
        active: true,
        selfSearch: false,
      },
      searchImage: {
        active: true,
        price: 'usDollar',
        options: {
          add: {
            uploadKey: {
              location: 'data',
              name: 'uploadKey',
            },
            'this.key': {
              location: 'headers',
              name: 'x-api-key',
            },
          },
          method: 'POST',
          url: 'https://api.zapiex.com/v3/image/search',
          data: {
            sort: 'BEST_MATCH',
            filter: 'AUTO',
          },
          headers: {
            'content-type': 'application/json',
          },
          params: {},
        },
        error: {
          errorCheck: `result.data && result.data.data && result.data.data.items && result.data.data.items.length`,
          errorMessage: 'There was an error',
        },
        format: {
          data: `result.data.data`,
          totalProducts: `result.data.data.totalCount`,
          items: `result.data.data.items`,
          itemId: `item.productId`,
          itemName: `item.title`,
          itemPrice: `item.productMinPrice.value`,
          itemImageUrl: `item.imageUrl.replace('http:', 'https:')`,
        },
      },
      imageUpload: {
        active: true,
        price: 'usDollar',
        options: {
          imageConfig: {
            imageAccepted: 'BASE64',
          },
          add: {
            type: {
              location: 'data',
              name: 'type',
            },
            image: {
              location: 'data',
              name: 'image',
            },
            'this.key': {
              location: 'headers',
              name: 'x-api-key',
            },
          },
          method: 'POST',
          url: 'https://api.zapiex.com/v3/image/upload',
          data: {},
          headers: {
            'content-type': 'application/json',
          },
          params: {},
        },
        error: {
          errorCheck: `result.data && result.data.data && result.data.data.uploadKey && result.data.data.uploadKey.length`,
          errorMessage: 'There was an error',
        },
        format: {
          data: `result.data.data`,
          uploadKey: `result.data.data.uploadKey`,
        },
      },

      keyword: {
        active: true,
        price: 'usDollar',
        options: {
          add: {
            kw: {
              location: 'data',
              name: 'text',
            },
            pageNum: {
              location: 'data',
              name: 'page',
            },
            'this.key': {
              location: 'headers',
              name: 'x-api-key',
            },
          },
          method: 'POST',
          url: 'https://api.zapiex.com/v3/search',
          data: {
            currency: 'USD',
            locale: 'en_US',
            shipFrom: 'CN',
            shipTo: 'US',
            freeShippingOnly: false,
            moreThanFourStarsOnly: false,
            sort: 'BEST_MATCH',
          },
          headers: {
            'content-type': 'application/json',
          },
          params: {},
        },
        error: {
          errorCheck: `result.data && result.data.data && result.data.data.items && result.data.data.items.length`,
          errorMessage: 'There was an error',
        },
        format: {
          data: `result.data.data`,
          totalProducts: `result.data.data.totalCount`,
          items: `result.data.data.items`,
          itemId: `item.productId`,
          itemName: `item.title`,
          itemPrice: `item.productMinPrice.value + item.shippingMinPrice.value`,
          itemImageUrl: `item.imageUrl.replace('http:', 'https:')`,
        },
      },
      productDetail: {
        active: true,
        price: 'usDollar',
        options: {
          add: {
            productId: {
              location: 'data',
              name: 'productId',
            },
            'this.key': { location: 'headers', name: 'x-api-key' },
          },
          method: 'POST',
          url: 'https://api.zapiex.com/v3/product/details',
          data: {
            getShipping: true,
            quantity: 1,
            getHtmlDescription: true,
            locale: 'en_US',
            shipFrom: 'CN',
            shipTo: 'US',
          },
          headers: {
            'content-type': 'application/json',
          },
          params: {},
        },
        error: {
          errorCheck: `result.data && result.data.data && result.data.data.productId && result.data.data.productId.length`,
          errorMessage: 'There was an error',
        },
        format: {
          data: `result.data.data`,
          bigImageUrl: `result.data.data.productImages[0]`,
          smallImages: `result.data.data.productImages.map((img)=>img)`,
          title: `result.data.data.title.replace('- AliExpress','- Kachuwa')`,
          stock: `result.data.data.totalStock`,
          productId: `result.data.data.productId`,
          categoryId: `result.data.data.productCategory.id`,
          categoryName: `result.data.data.productCategory.name`,
          price: `
            const temp_price = data.price || data.priceSummary; 
              if (temp_price.web.discountedPrice.min) {
                temp_price.web.discountedPrice.min.value
                  ? temp_price.web.discountedPrice.min.value
                  : temp_price.web.originalPrice.min.value;
              } else {
              temp_price.web.discountedPrice.value
                  ? temp_price.web.discountedPrice.value
                  : temp_price.web.originalPrice.value;
              }
            `,
          sellerShippingPrice: `result.data.data.shipping.carriers[0].price.value?data.shipping.carriers[0].price.value:0`,
          description: `result.data.data.htmlDescription`,
          skus: { type: 'arr', path: `result.data.data.variations` },
          skusProperties: {
            type: 'arr',
            path: `result.data.data.properties`,
          },
          skuId: `"unknown"`,
          sku: `sku.sku`,
          skuPrice: `sku.price.web.discountedPrice.value`,
          skuStock: `sku.stock`,
          mainId: `property.id`,
          innerValues: { type: 'arr', path: `property.values` },
          displayName: `property.name`,
          secondaryId: `innerValue.id`,
          value: `innerValue.name`,
          pic: `innerValue.imageUrl`,
          removeOtherAndMakeOne: {
            200007763: {
              values: ['201336100', '201441035'],
            },
          },
        },
      },
    },
  },
  taobao: {
    listOfApis: ['zxss', 'onebound'],
    activeApi: 'zxss',
    slug: 'tb',
    zxss: {
      apiKey: process.env.TAOBAO_API_KEY,
      imageSearch: {
        active: false,
        selfSearch: true,
      },
      imageUpload: {
        active: false,
        price: 'chineseYuan',
        options: {
          imageConfig: {
            imageAccepted: 'url',
          },
          add: {
            uploadKey: {
              location: 'params',
              name: 'image_path',
            },
            'this.key': { location: 'params', name: 'appkey' },
          },
          method: 'GET',
          url: 'http://api-sg.zzqss.com/api.php?path=imagesearch',
          data: {},
          headers: {
            'content-type': 'application/json',
          },
          params: {},
        },
        error: {
          errorCheck: `result.data && result.data.data && result.data.data.items && result.data.data.items.length`,
          errorMessage: 'There was an error',
        },
        format: {
          data: `result.data.data`,
          totalProducts: `result.data.data.totalCount`,
          items: `result.data.data.items`,
          itemId: `item.productId`,
          itemName: `item.title`,
          itemPrice: `item.productMinPrice.value + item.shippingMinPrice.value`,
          itemImageUrl: `item.imageUrl.replace('http:', 'https:')`,
        },
      },
      keyword: {
        active: true,
        price: 'chineseYuan',
        options: {
          add: {
            kw: { location: 'params', name: 'keyword' },
            pageNum: { location: 'params', name: 'page' },
            'this.key': { location: 'params', name: 'appkey' },
          },
          method: 'GET',
          url: 'http://api-sg.zzqss.com/api.php?path=getlist',
          data: {},
          headers: {},
          params: {},
        },
        error: {
          errorCheck: `result.data && result.data.data && result.data.data.dataarray && result.data.data.dataarray.length`,
          errorMessage: 'There was an error',
        },
        format: {
          data: `result.data.data`,
          totalProducts: `result.data.data.total`,
          items: `result.data.data.dataarray`,
          itemId: `item.item_id`,
          itemName: `item.title`,
          itemPrice: `item.price_with_rate`,
          itemImageUrl:
            "item.pic_url ? item.pic_url.includes('http') ? item.pic_url.replace('http:', 'https:'): `https:${item.pic_url}`: ''",
        },
      },
      productDetail: {
        active: true,
        price: 'chineseYuan',
        options: {
          add: {
            productId: {
              location: 'params',
              name: 'id',
            },
            'this.key': { location: 'params', name: 'appkey' },
          },
          method: 'GET',
          url: 'http://api-sg.zzqss.com/api.php?path=itemview',
          data: {},
          headers: {
            'content-type': 'application/json',
          },
          params: {
            type: 'json',
          },
        },
        error: {
          errorCheck: `result.data && result.data.data && result.data.data.value && result.data.data.value.num_iid && result.data.data.value.num_iid > 0`,
          errorMessage: 'There was an error',
        },
        format: {
          data: `result.data.data`,
          bigImageUrl:
            "result.data.data.value.pic_url  ? result.data.data.value.pic_url.includes('http') ? result.data.data.value.pic_url.replace('http:', 'https:'): `https:${result.data.data.value.pic_url}`: ''",
          smallImages: [
            'result.data.data.value.images.map((img) => {',
            'if (img) {',
            "if (img.includes('http')) {",
            "return img.replace('http:', 'https:');",
            '} else {',
            'return `https:${img}`;',
            '}',
            '} else {',
            'return ;',
            '}',
            '})',
          ].join(''),
          title: `result.data.data.value.title.replace('Taobao','Kachuwa')`,
          stock: `1000`,
          productId: `result.data.data.value.num_iid`,
          categoryId: `result.data.data.value.categoryId`,
          categoryName: `result.data.data.value.catename`,
          price: `result.data.data.value.price`,
          sellerShippingPrice: `0`,
          description: `result.data.data.value.deschtml`,
          skus: { type: 'arr', path: `result.data.data.value.skus.sku` },
          skusProperties: {
            type: 'obj',
            path: `result.data.data.value.prop_names`,
          },
          skuId: `"unknown"`,
          sku: `sku.properties`,
          skuPrice: `sku.price`,
          skuStock: `sku.quantity`,
          mainId: `primaryKey`,
          innerValues: { type: 'obj', path: `primaryValue.value` },
          displayName: `primaryValue.name`,
          secondaryId: `secondaryKey`,
          value: `secondaryValue`,
          pic: [
            'const picResult = data.value.item_imgs.item_img.find((im) => mainId +":"+ secondaryId  == im.properties);',
            'let pic;',
            'if (picResult) {',
            'pic = picResult.url',
            "? picResult.url.includes('http')",
            "? picResult.url.replace('http:', 'https:')",
            ': `https:${picResult.url}`',
            ": '';",
            '} else {',
            'pic = mainId +":"+ secondaryId ',
            '}',
          ].join(''),
        },
      },
    },
  },
};

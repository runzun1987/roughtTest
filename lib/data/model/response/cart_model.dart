class CartModel {
  String _userPhone;
  int _stock;
  int _quantity;
  double _price;
  String _skuId;
  List _detailArr;
  int _productId;
  String _bigImageUrl;
  String _title;
  double _sellerShippingPrice;
  String _provider;

  CartModel(
    this._userPhone,
    this._stock,
    this._quantity,
    this._price,
    this._skuId,
    this._detailArr,
    this._productId,
    this._bigImageUrl,
    this._title,
    this._sellerShippingPrice,
    this._provider,
  );

  String get userPhone => _userPhone;
  int get stock => _stock;
  int get quantity => _quantity;
  double get price => _price;
  String get skuId => _skuId;
  List get detailArr => _detailArr;
  int get productId => _productId;
  String get bigImageUrl => _bigImageUrl;
  String get title => _title;
  double get sellerShippingPrice => _sellerShippingPrice;
  String get provider => _provider;
}

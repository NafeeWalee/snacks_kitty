
class PromoClass {
  String imageURL;

  PromoClass({this.imageURL});
}

class HorizontalModelClass {
  String imageURL;
  String storeName;
  String storeAddress;
  double rate;
  int deliveryFee;
  int review;

  HorizontalModelClass({this.imageURL,this.storeName,this.deliveryFee,this.rate,this.review,this.storeAddress});
}


List<PromoClass> promoClass = [
  PromoClass(
      imageURL:
      'https://www.cats.com.my/imgWeb/product/CatsFoodAdsDemo1_291119-01.jpg'),
  PromoClass(
      imageURL:
      'https://images.nekojam.com/wp-content/uploads/2020/06/02140645/ciao-churu-liquid-cat-treats-5-off-festive-50-pack-bundle-resized.png'),
  PromoClass(
      imageURL:
      'https://catingtonpost.com/wp-content/uploads/2017/08/744731a608bfb3a7c24117fe556f8408-vintage-food-vintage-cat.jpg'),
  PromoClass(
      imageURL:
      'https://img.lovepik.com/desgin_photo/40016/5787_detail.jpg!detail808'),
];

List<HorizontalModelClass> favoriteClass = [
  HorizontalModelClass(imageURL: 'https://hw.menardc.com/main/items/media/SMUCK001/ProductXLarge/2531349.jpg',storeName: 'Kitty Throne', storeAddress: '69, At your home, near your bed.',deliveryFee: 7,review: 999,rate: 4.5),

  HorizontalModelClass(
      imageURL:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBWc1Em4f8icAQ25Siz21Uhj0YtyzEyIJVcA&usqp=CAU',storeName: 'Kitty Throne', storeAddress: '69, At your home, near your bed.',deliveryFee: 7,review: 999,rate: 4.5),
  HorizontalModelClass(
      imageURL:
      'https://img.chewy.com/is/catalog/110181_MAIN._AC_SL1500_V1484322851_.jpg',storeName: 'Kitty Throne', storeAddress: '69, At your home, near your bed.',deliveryFee: 7,review: 999,rate: 4.5),
  HorizontalModelClass(
      imageURL:
      'https://storage.googleapis.com/petcircle-assets/images/products/p/paw-and-spoon-salmon-and-chicken-wet-cat-food.png',storeName: 'Kitty Throne', storeAddress: '69, At your home, near your bed.',deliveryFee: 7,review: 999,rate: 4.5),
];

List<HorizontalModelClass> newItems = [
  HorizontalModelClass(imageURL: 'https://images-na.ssl-images-amazon.com/images/I/71uNRpO6LJL.jpg',storeName: 'Meow Box', storeAddress: '69, At your home, near your bed.',deliveryFee: 7,review: 999,rate: 4.5),

  HorizontalModelClass(
      imageURL:
      'https://s3.eu-west-2.amazonaws.com/devo.core.images/products/thumbnail/7613036051187.jpg',storeName: 'Meow Box', storeAddress: '69, At your home, near your bed.',deliveryFee: 7,review: 999,rate: 4.5),
  HorizontalModelClass(
      imageURL:
      'https://i.ebayimg.com/images/g/A7sAAOSwk8pgF6Zq/s-l400.png',storeName: 'Meow Box', storeAddress: '69, At your home, near your bed.',deliveryFee: 7,review: 999,rate: 4.5),
  HorizontalModelClass(
      imageURL:
      'https://www.rover.com/blog/wp-content/uploads/2020/07/51by4b7gLkL-1.jpg',storeName: 'Meow Box', storeAddress: '69, At your home, near your bed.',deliveryFee: 7,review: 999,rate: 4.5),
];

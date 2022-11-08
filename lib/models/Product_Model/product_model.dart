class ProductModel
{
  dynamic image;
  String? name;
  String? price;
  String? quantity;
  String? productDetail;
  dynamic calories;
  dynamic carbs;
  dynamic fat;
  dynamic protein;
  num? review;

  ProductModel({this.image, this.name, this.price, this.quantity});
  ProductModel.fromJason(Map<String, dynamic> jason)
  {
    image = jason['image'];
    name = jason['name'];
    price = jason['price'];
    quantity = jason['quantity'];
    productDetail = jason['product detail'] ?? 'There is no details';
    calories = jason['calories'] ?? '0';
    carbs = jason['carbs'] ?? '0';
    fat = jason['fat'] ?? '0';
    protein = jason['protein'] ?? '0';
    review = jason['review'] ?? 3.5;
  }
  Map<String, dynamic> toMap()
  {
    return
      {
        'image' : image,
        'name': name,
        'price'  : price,
        'quantity'  : quantity,
        'product detail'  : productDetail,
        'calories'  : calories,
        'carbs'  : carbs,
        'fat'  : fat,
        'protein'  : protein,
        'review'  : review,
      };
  }
}
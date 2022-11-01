class ProductModel
{
  String? image;
  String? name;
  String? price;
  String? quantity;

  ProductModel({this.image, this.name, this.price, this.quantity});
  ProductModel.fromJason(Map<String, dynamic> jason)
  {
    image = jason['image'];
    name = jason['name'];
    price = jason['price'];
    quantity = jason['quantity'];
  }
  Map<String, dynamic> toMap()
  {
    return
      {
        'image' : image,
        'name': name,
        'price'  : price,
        'quantity'  : quantity,
      };
  }
}
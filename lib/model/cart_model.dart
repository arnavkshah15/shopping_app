class CartItem {
  final String title;
  final double price;
  final int quantity;
  final String image;

  CartItem({required this.title, required this.price, required this.quantity,required this.image});

  CartItem.fromMap(Map<dynamic , dynamic> res)
  : title= res['title'],
  price= res['price'],
  quantity= res['quantity'],
  image= res['image'];

  Map<String, Object?> toMap(){
    return{
      'title':title,
      'price':price,
      'quantity':quantity,
      'image':image,
    };
  }
}
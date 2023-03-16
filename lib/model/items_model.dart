class Items{
  final String? id;
  final String? title;
  final String? price;
  final String? category;
  final String? description;
  final String? image;

Items({
  this.id,this.title,this.price,this.category,this.description,
  this.image,
});
factory Items.fromJson(Map<String, dynamic> json){
  return Items(
    id: json['id'] as String?,
    title: json['title'] as String?,
    price: json['price'] as String?,
    category: json['category'] as String?,
    description: json['description'] as String?,
    image: json['image'] as String?,
  );
}
}
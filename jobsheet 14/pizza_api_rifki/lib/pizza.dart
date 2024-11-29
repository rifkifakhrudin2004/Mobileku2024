class Pizza {
  int id;
  String pizzaName;
  String description;
  double price;
  String imageUrl;

  // Konstruktor biasa tanpa final untuk memudahkan perubahan nilai
  Pizza({
    required this.id,
    required this.pizzaName,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  // Konstruktor named untuk membuat objek dari JSON
  Pizza.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        pizzaName = json['pizzaName'],
        description = json['description'],
        price = json['price'],
        imageUrl = json['imageUrl'];

  // Konversi objek Pizza menjadi JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pizzaName': pizzaName,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    };
  }
}

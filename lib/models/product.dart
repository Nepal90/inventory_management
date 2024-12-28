class Product {
  final String id;
  final String name;
  final String description;
  final String photoUrl;
  final DateTime firstInventoryDate;
  final String supervisorName;
  final int currentStock;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.photoUrl,
    required this.firstInventoryDate,
    required this.supervisorName,
    required this.currentStock,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      photoUrl: json['photoUrl'],
      firstInventoryDate: DateTime.parse(json['firstInventoryDate']),
      supervisorName: json['supervisorName'],
      currentStock: json['currentStock'],
    );
  }

  Product? copyWith({required int currentStock}) {}
}
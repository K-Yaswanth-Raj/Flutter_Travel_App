class Model {
  late int id;
  late String name;
  late String description;
  late int price;
  late int stars;
  late int people;
  late int selectedPeople;
  late String img;
  late String location;
  late String createdAt;
  late String updatedAt;

  Model({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stars,
    required this.people,
    required this.selectedPeople,
    required this.img,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
  });

  Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stars = json['stars'];
    people = json['people'];
    selectedPeople = json['selected_people'];
    img = json['img'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['stars'] = this.stars;
    data['people'] = this.people;
    data['selected_people'] = this.selectedPeople;
    data['img'] = this.img;
    data['location'] = this.location;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

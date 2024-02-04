import 'dart:convert';

class Welcome {
    bool status;
    String message;
    List<Learning> data;

    Welcome({
        required this.status,
        required this.message,
        required this.data,
    });

    factory Welcome.fromRawJson(String str) => Welcome.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        status: json["status"],
        message: json["message"],
        data: List<Learning
        >.from(json["data"].map((x) => Learning
        .fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Learning
 {
    int id;
    String title;
    String instructor;
    int price;
    double rating;
    String images;
    String lessons;
    String duration;
    String description;
    DateTime createdAt;
    DateTime updatedAt;

    Learning
    ({
        required this.id,
        required this.title,
        required this.instructor,
        required this.price,
        required this.rating,
        required this.images,
        required this.lessons,
        required this.duration,
        required this.description,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Learning
    .fromRawJson(String str) => Learning
    .fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Learning.fromJson(Map<String, dynamic> json) => Learning
    (
        id: json["id"],
        title: json["title"],
        instructor: json["instructor"],
        price: json["price"],
        rating: json["rating"]?.toDouble(),
        images: json["images"],
        lessons: json["lessons"],
        duration: json["duration"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "instructor": instructor,
        "price": price,
        "rating": rating,
        "images": images,
        "lessons": lessons,
        "duration": duration,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

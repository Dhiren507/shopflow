List<Map<String, dynamic>> dummyReviewJsonList = [
  {
    "id": 1,
    "username": "Alex Johnson",
    "reviewText": "Absolutely love these shorts! The fabric feels premium, and the fit is spot on for a casual summer day.",
    "rating": 5.0,
    "userImage": "https://pravatar.cc",
    "creationAt": "2026-09-14T10:00:00.000Z",
    "updatedAt": "2026-09-14T10:00:00.000Z",
  },
  {
    "id": 2,
    "username": "Sarah Miller",
    "reviewText": "Great color and nice tailored look. They run slightly small around the waist, so consider sizing up if you're between sizes.",
    "rating": 4.2,
    "userImage": "https://pravatar.cc",
    "creationAt": "2026-09-13T14:22:15.000Z",
    "updatedAt": "2026-09-13T15:30:00.000Z",
  },
  {
    "id": 3,
    "username": "Marcus Vance",
    "reviewText": "Decent shorts, but the stitching near the front pocket started fraying after the first wash. A bit disappointed for the price.",
    "rating": 3.0,
    "userImage": "https://pravatar.cc",
    "creationAt": "2026-09-11T08:45:10.000Z",
    "updatedAt": "2026-09-11T08:45:10.000Z",
  },
  {
    "id": 4,
    "username": "Emily Chen",
    "reviewText": "Super comfortable and highly breathable material. Perfect for outdoor events or walking around the city.",
    "rating": 4.8,
    "userImage": "https://pravatar.cc",
    "creationAt": "2026-09-10T18:12:00.000Z",
    "updatedAt": "2026-09-10T18:12:00.000Z",
  },
  {
    "id": 5,
    "username": "David K.",
    "reviewText": "The color doesn't completely match the online photo—it looks a bit more olive green in person than what I expected. Fits well though.",
    "rating": 3.5,
    "userImage": "https://pravatar.cc",
    "creationAt": "2026-09-08T09:05:00.000Z",
    "updatedAt": "2026-09-08T09:05:00.000Z",
  },
];

class ProductModel {
  int? id;
  String? title;
  String? brandName;
  String? slug;
  int? price;
  int? discount;
  String? description;
  Category? category;
  List<String>? images;
  bool? isLiked;
  List<CustomerReview>? productReviews;
  ProductRating? ratings;
  int? productStock;
  int? productQuantity;
  String? creationAt;
  String? updatedAt;

  ProductModel({
    this.id,
    this.title,
    this.brandName,
    this.slug,
    this.price,
    this.discount,
    this.description,
    this.category,
    this.images,
    this.isLiked,
    this.productReviews,
    this.ratings,
    this.productStock,
    this.productQuantity = 1,
    this.creationAt,
    this.updatedAt,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    brandName = json['brandName'];
    slug = json['slug'];
    price = json['price'];
    discount = 10;
    description = json['description'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    ratings = json['ratings'] != null
        ? ProductRating.fromJson(json['ratings'])
        : ProductRating.fromJson({
            'avgRating': 4.5,
            'totalReviews': 1700,
            'fiveStarReviewCount': 300,
            'fourStarReviewCount': 400,
            'threeStarReviewCount': 500,
            'twoStarReviewCount': 500,
            'oneStarReviewCount': 100,
          });
    images = json['images'] != null
        ? List<String>.from(json['images'])
        : [
            'https://www.imageurlgenerator.com/_next/image?url=%2Fassets%2Ffree_tool.png&w=3840&q=75',
            'https://www.imageurlgenerator.com/_next/image?url=%2Fassets%2Ffree_tool.png&w=3840&q=75',
            'https://www.imageurlgenerator.com/_next/image?url=%2Fassets%2Ffree_tool.png&w=3840&q=75',
          ];
    isLiked = json['isLiked'];
    productStock = 300;
    productQuantity = json['productQuantity'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];

    productReviews = (json['productReviews'] != null)
        ? List<CustomerReview>.from(
            json['productReviews'].map((v) => CustomerReview.fromJson(v)),
          )
        : dummyReviewJsonList.map((v) => CustomerReview.fromJson(v)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['brandName'] = brandName;
    data['slug'] = slug;
    data['price'] = price;
    data['discount'] = discount;
    data['description'] = description;
    if (ratings != null) {
      data['ratings'] = ratings!.toJson();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['images'] = images;
    data['isLiked'] = isLiked;
    data['productStock'] = productStock;
    data['productQuantity'] = productQuantity;
    data['creationAt'] = creationAt;
    data['updatedAt'] = updatedAt;
    if (productReviews != null) {
      data['productReviews'] = productReviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? slug;
  String? image;
  String? creationAt;
  String? updatedAt;

  Category({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.creationAt,
    this.updatedAt,
  });

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['image'] = image;
    data['creationAt'] = creationAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class CustomerReview {
  int? id;
  String? username;
  String? reviewText;
  num? rating;
  String? userImage;
  String? creationAt;
  String? updatedAt;

  CustomerReview({
    this.id,
    this.username,
    this.reviewText,
    this.rating,
    this.userImage,
    this.creationAt,
    this.updatedAt,
  });

  factory CustomerReview.fromJson(Map<String, dynamic> json) {
    return CustomerReview(
      id: json['id'],
      username: json['username'],
      reviewText: json['reviewText'],
      rating: json['rating'],
      userImage: json['userImage'],
      creationAt: json['creationAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'reviewText': reviewText,
      'rating': rating,
      'userImage': userImage,
      'creationAt': creationAt,
      'updatedAt': updatedAt,
    };
  }
}

class ProductRating {
  num? avgRating;
  int? totalReviews;
  int? fiveStarReviewCount;
  int? fourStarReviewCount;
  int? threeStarReviewCount;
  int? twoStarReviewCount;
  int? oneStarReviewCount;

  ProductRating({
    this.avgRating,
    this.totalReviews,
    this.fiveStarReviewCount,
    this.fourStarReviewCount,
    this.threeStarReviewCount,
    this.twoStarReviewCount,
    this.oneStarReviewCount,
  });

  factory ProductRating.fromJson(Map<String, dynamic> json) {
    return ProductRating(
      avgRating: json['avgRating'],
      totalReviews: json['totalReviews'],
      fiveStarReviewCount: json['fiveStarReviewCount'],
      fourStarReviewCount: json['fourStarReviewCount'],
      threeStarReviewCount: json['threeStarReviewCount'],
      twoStarReviewCount: json['twoStarReviewCount'],
      oneStarReviewCount: json['oneStarReviewCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'avgRating': avgRating,
      'totalReviews': totalReviews,
      'fiveStarReviewCount': fiveStarReviewCount,
      'fourStarReviewCount': fourStarReviewCount,
      'threeStarReviewCount': threeStarReviewCount,
      'twoStarReviewCount': twoStarReviewCount,
      'oneStarReviewCount': oneStarReviewCount,
    };
  }
}

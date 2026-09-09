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
    this.creationAt,
    this.updatedAt,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    brandName = json['brandName'];
    slug = json['slug'];
    price = json['price'];
    discount = json['discount'];
    description = json['description'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    ratings = json['ratings'] != null
        ? ProductRating.fromJson(json['ratings'])
        : null;
    images = json['images'] != null ? List<String>.from(json['images']) : null;
    isLiked = json['isLiked'];
    productStock = json['productStock'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];

    if (json['productReviews'] != null) {
      productReviews = <CustomerReview>[];
      json['productReviews'].forEach((v) {
        productReviews!.add(CustomerReview.fromJson(v));
      });
    }
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

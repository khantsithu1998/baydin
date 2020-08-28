// To parse this JSON data, do
//
//     final post = postFromMap(jsonString);

import 'dart:convert';

List<Post> postFromMap(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromMap(x)));

String postToMap(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Post {
  Post({
    this.id,
    this.authorId,
    this.categoryId,
    this.title,
    this.seoTitle,
    this.excerpt,
    this.body,
    this.image,
    this.slug,
    this.metaDescription,
    this.metaKeywords,
    this.status,
    this.featured,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String authorId;
  String categoryId;
  String title;
  dynamic seoTitle;
  dynamic excerpt;
  String body;
  String image;
  String slug;
  dynamic metaDescription;
  dynamic metaKeywords;
  String status;
  String featured;
  DateTime createdAt;
  DateTime updatedAt;

  factory Post.fromMap(Map<String, dynamic> json) => Post(
    id: json["id"],
    authorId: json["author_id"],
    categoryId: json["category_id"],
    title: json["title"],
    seoTitle: json["seo_title"],
    excerpt: json["excerpt"],
    body: json["body"],
    image: json["image"],
    slug: json["slug"],
    metaDescription: json["meta_description"],
    metaKeywords: json["meta_keywords"],
    status: json["status"],
    featured: json["featured"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "author_id": authorId,
    "category_id": categoryId,
    "title": title,
    "seo_title": seoTitle,
    "excerpt": excerpt,
    "body": body,
    "image": image,
    "slug": slug,
    "meta_description": metaDescription,
    "meta_keywords": metaKeywords,
    "status": status,
    "featured": featured,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

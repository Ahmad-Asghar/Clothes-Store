class ProductsRepoModel {
  final String image;
  final String name;
  final int price;
  final String brandName;
  final String description;
  final String selectedSize;
  String? displayImage;

  ProductsRepoModel({
    required this.name,
    required this.image,
    required this.price,
    required this.brandName,
    required this.selectedSize,
    required this.description,
    this.displayImage
  });

  static List<ProductsRepoModel> sliderList = [
    ProductsRepoModel(
      name: "Oxford Shirt",
      image: "assets/images/m1.jpg",
      price: 40,
      brandName: "Classic Fit",
      selectedSize: "M",
      description: "A timeless oxford shirt with a tailored fit. Perfect for business casual looks or pairing with your favorite jeans.",
    ),
    ProductsRepoModel(
      name: "Flannel Shirt",
      image: "assets/images/m2.png",
      price: 35,
      brandName: "Cozy Layers",
      selectedSize: "L",
      description: "Stay warm and stylish with this flannel shirt. Soft, comfortable, and ideal for layering during colder months.",
    ),
    ProductsRepoModel(
      name: "Denim Jacket",
      image: "assets/images/m3.jpg",
      price: 65,
      brandName: "Urban Edge",
      selectedSize: "L",
      description: "A rugged denim jacket that never goes out of style. Durable and versatile, perfect for adding a casual vibe.",
    ),
    ProductsRepoModel(
      name: "Puffer Jacket",
      image: "assets/images/m4.jpg",
      price: 80,
      brandName: "Winter Warm",
      selectedSize: "XL",
      description: "This insulated puffer jacket keeps you warm during cold weather. Lightweight yet effective, it's a winter essential.",
    ),
    ProductsRepoModel(
      name: "Plaid Shirt",
      image: "assets/images/m5.jpg",
      price: 30,
      brandName: "Casual Comfort",
      selectedSize: "M",
      description: "A classic plaid shirt that offers both comfort and style. Easy to dress up or down for any occasion.",
    ),
    ProductsRepoModel(
      name: "Leather Jacket",
      image: "assets/images/m6.jpg",
      price: 120,
      brandName: "Moto Style",
      selectedSize: "L",
      description: "This leather jacket brings a bold and edgy look to your outfit. Durable, stylish, and built for lasting wear.",
    ),

  ];


  static List<ProductsRepoModel> bannersList =[
    ProductsRepoModel(
      name: "Bomber Jacket",
      image: "assets/images/b_full2.jpg",
      displayImage: "assets/images/b2.jpg",
      price: 90,
      brandName: "Street Vibe",
      selectedSize: "M",
      description: "A modern bomber jacket with a sleek design. Lightweight, perfect for adding a trendy layer to any outfit.",
    ),
    ProductsRepoModel(
      name: "Field Jacket",
      image: "assets/images/b_full4.jpg",
      displayImage: "assets/images/b4.jpg",
      price: 85,
      brandName: "Outdoor Essential",
      selectedSize: "XL",
      description: "A functional field jacket that combines rugged style with practical features. Perfect for outdoor adventures and city wear.",
    ),
    ProductsRepoModel(
      name: "Chambray Shirt",
      image: "assets/images/b_full3.png",
      displayImage: "assets/images/b3.png",
      price: 45,
      brandName: "Denim Luxe",
      selectedSize: "L",
      description: "This chambray shirt offers a denim look with a lighter feel. Versatile and stylish, ideal for casual occasions.",
    ),
    ProductsRepoModel(
      name: "Henley Shirt",
      image: "assets/images/b_full1.jpg",
      displayImage: "assets/images/b1.jpg",
      price: 28,
      brandName: "Laidback Cool",
      selectedSize: "S",
      description: "This versatile Henley shirt combines comfort with a touch of style. A great layering piece for casual wardrobes.",
    ),
  ];


}



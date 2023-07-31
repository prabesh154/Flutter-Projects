class ListTilesValues {
  final String title;
  final String imageName;
  final String subtitle;
  final String price;
  ListTilesValues(
    this.title,
    this.imageName,
    this.subtitle,
    this.price,
  );
}

List<ListTilesValues> tabdataList = [
  ListTilesValues(
      "Short Dress", "assets/images/fashion2.jpeg", "Adidas", "Rs.400"),
  ListTilesValues(
      "Office Formals", "assets/images/fashion1.jpeg", "Lenin Pants", "Rs.347"),
  ListTilesValues(
      "Casual Jeans", "assets/images/fashion4.png", "Dr.Denim", "Rs.842"),
  ListTilesValues(
      "Jeans Skirt", "assets/images/fashion3.jpg", "Brocade", "Rs.246"),
];

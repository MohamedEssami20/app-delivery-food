abstract class CategoryPrdouctsItem {
  final String title;

  CategoryPrdouctsItem({required this.title});

  static List<String> getCategoryItems() {
    return ["Offers", "Burger", "Pizza", "Dount", "Soft Drink", "Ice Cream"];
  }
}

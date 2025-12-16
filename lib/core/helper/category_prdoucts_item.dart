abstract class CategoryPrdouctsItem {
  final String title;

  CategoryPrdouctsItem({required this.title});

  static List<String> getCategoryItems() {
    return ["Offers", "Pizza", "Soft Drink", "Burger", "Dount", "Ice Cream"];
  }
}

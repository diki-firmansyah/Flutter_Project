class Menu {
  String imageUrl;
  String name;
  int price;
  List<Menu> someplace;

  Menu({
    this.imageUrl,
    this.name,
    this.price,
    this.someplace,
  });
}

List<Menu> menu = [
  Menu(
    imageUrl: 'image/ayam_goreng.jpg',
    name: 'Ayam Goreng',
    price: 20000,
  ),
  Menu(
    imageUrl: 'image/burger.jpg',
    name: 'Gudeg',
    price: 25000,
  ),
  Menu(
    imageUrl: 'image/cilok.jpg',
    name: 'Cilok',
    price: 10000,
  ),
  Menu(
    imageUrl: 'image/gudeg.jpg',
    name: 'Gudeg',
    price: 10000,
  ),
  Menu(
    imageUrl: 'image/ikan_sambel.jpg',
    name: 'Ikan Sambel',
    price: 30000,
  ),
  Menu(
    imageUrl: 'image/kepiting_saos.jpg',
    name: 'Kepiting Saos Pedas',
    price: 30000,
  ),
  Menu(
    imageUrl: 'image/kerang.jpg',
    name: 'Kerang',
    price: 15000,
  ),
  Menu(
    imageUrl: 'image/mendoan.jpg',
    name: 'Mendoan',
    price: 12000,
  ),
  Menu(
    imageUrl: 'image/sop_daging.jpg',
    name: 'Sop Daging',
    price: 25000,
  ),
  Menu(
    imageUrl: 'image/sosis_telur.jpg',
    name: 'Sosi Telur',
    price: 20000,
  ),
  Menu(
    imageUrl: 'image/udang_tepung.jpg',
    name: 'Udang Tepung',
    price: 25000,
  ),
];

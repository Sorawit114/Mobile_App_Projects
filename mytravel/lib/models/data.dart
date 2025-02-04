class Destination {
  late String name;
  late String image;
  late String rate;
  late String location;

  Destination(this.name, this.image, this.rate, this.location);
}

List<Destination> destinations = [
  Destination('Forest', 'assets/images/forest.jpg', '5.0', 'Thailand'),
  Destination('Fog', 'assets/images/fog.jpg', '5.0', 'UK'),
  Destination('Fog in the Forest', 'assets/images/fog2.jpg', '4.0', 'China'),
  Destination('Animal', 'assets/images/bison.jpg', '3.5', 'Thailand'),
  Destination('Mountains', 'assets/images/mountains.jpg', '4.5', 'Brazil'),
  Destination('Ocean', 'assets/images/ocean.jpg', '5.0', 'Brazil'),
  Destination('WaterFall', 'assets/images/waterfall.jpg', '5.0', 'Thai'),
  Destination('yellowstone', 'assets/images/yellowstone.jpg', '5.0', 'US'),
];

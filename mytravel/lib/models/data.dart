class Destination {
  late String name;
  late String image;
  late String rate;
  late String location;

  Destination(this.name, this.image, this.rate, this.location);
}

List<Destination> destinations = [
  Destination('forest', 'assets/images/forest.jpg', '5.0', 'somewhere'),
  Destination('fog', 'assets/images/fog.jpg', '5.0', 'somewhere'),
  Destination('fog2', 'assets/images/fog2.jpg', '4.0', 'somewhere'),
  Destination('animal', 'assets/images/bison.jpg', '3.5', 'somewhere'),
  Destination('mountains', 'assets/images/mountains.jpg', '4.5', 'somewhere'),
  Destination('ocean', 'assets/images/ocean.jpg', '5.0', 'somewhere'),
  Destination('waterfall', 'assets/images/waterfall.jpg', '5.0', 'Thai'),
  Destination('yellowstone', 'assets/images/yellowstone.jpg', '5.0', 'US'),
];

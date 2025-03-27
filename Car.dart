import 'Vehicle.dart';

class Car extends Vehicle {
  @override
  void move() {
    print(
        "The car is moving at $speed km/h."); // I'm using the getter to get the speed
  }
}

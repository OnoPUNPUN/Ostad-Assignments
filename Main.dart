import 'Car.dart';

void main() {
  Car car1 = Car();

  car1.setSpeed(43);
  car1.move();

  // Trying to set a negative speed
  car1.setSpeed(-4);
}

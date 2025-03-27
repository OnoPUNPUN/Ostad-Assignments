abstract class Vehicle {
  int _speed = 0;

  void move();

  void setSpeed(int speed) {
    if (speed >= 0) {
      _speed = speed;
    } else {
      print("Speed cannot be negative.");
    } // I've used this so that no negative speed can be set
  }

  int get speed => _speed; // In order to get the speed
}

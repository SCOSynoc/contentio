import 'package:contientiao/common/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  /// given when then

  test("given counter class when instantiated then the value of count should be 0", (){
      // Arrange
      final Counter counter = Counter();
      // Act
      final val = counter.count;
      // Assert
      expect(val, 0);

  });

  test("given counter class when incremented then the value of count should be 1", (){
    // Arrange
    final Counter counter = Counter();
    // Act
    counter.incrementCounter();
    final val = counter.count;
    // Assert
    expect(val, 1);

  });
}
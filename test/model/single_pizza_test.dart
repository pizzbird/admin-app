import 'package:admin_app/models/single_pizza.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var _singlePizza = const SinglePizza(
    uuid: 'uuid',
    title: '',
    sizes: [
      PizzaSize(name: 'test', price: 10),
      PizzaSize(name: 'test2', price: 20)
    ],
  );
  test('Single pizza', () {
    expect(_singlePizza.priceCalculator(count: 1), 10);
  });
  test('With custom size', () {
    var pizzaSize = const PizzaSize(name: '', price: 20);
    expect(_singlePizza.priceCalculator(count: 2, pizzaSize: pizzaSize), 40);
  });
  test('With toping', () {
    var toping = [
      AttrCartItem(
        count: 2,
        attr: const Topping(name: 'test topping', price: 20),
      )
    ];
    expect(_singlePizza.priceCalculator(count: 1, toppingsList: toping), 50);
  });
  test('With toping and custom size', () {
    var toping = [
      AttrCartItem(
        count: 2,
        attr: const Topping(name: 'test topping', price: 20),
      )
    ];
    var pizzaSize = const PizzaSize(name: '', price: 20);
    expect(
        _singlePizza.priceCalculator(
            count: 1, pizzaSize: pizzaSize, toppingsList: toping),
        60);
    expect(
        _singlePizza.priceCalculator(
          count: 2,
          pizzaSize: pizzaSize,
          toppingsList: toping,
        ),
        80);
  });
}

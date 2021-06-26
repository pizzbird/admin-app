import 'package:admin_app/models/single_pizza.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var _singlePizza = const SinglePizza(
    uuid: 'uuid',
    title: '',
    sizes: [
      PizzaSize(name: 'test', price: 10, uuid: 'uuid'),
      PizzaSize(name: 'test2', price: 20, uuid: 'uuid')
    ],
  );
  test('Single pizza', () {
    expect(_singlePizza.priceCalculator(count: 1), 10);
  });
  test('With custom size', () {
    var pizzaSize = const PizzaSize(name: '', price: 20, uuid: 'uuid');
    expect(_singlePizza.priceCalculator(count: 2, pizzaSize: pizzaSize), 40);
  });
  test('With toping', () {
    var toping = [
      AttrCartItem(
        count: 2,
        attr: const Topping(name: 'test topping', price: 20, uuid: 'uuid'),
      )
    ];
    expect(_singlePizza.priceCalculator(count: 1, toppingsList: toping), 50);
  });
  test('With toping and custom size', () {
    var toping = [
      AttrCartItem(
        count: 2,
        attr: const Topping(name: 'test topping', price: 20, uuid: 'uuid'),
      )
    ];
    var pizzaSize = const PizzaSize(name: '', price: 20, uuid: 'uuid');
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

  test('Toppings fromJson', () {
    var _toppingFromJson =
        Topping.fromJson({'name': 'test topping', 'price': 20, 'uuid': 'uuid'});
    var _topping = const Topping(name: 'test topping', price: 20, uuid: 'uuid');
    expect(
      _topping,
      equals(_toppingFromJson),
    );
  });

  test('Single Pizza fromJson', () {
    var _singlePizza = SinglePizza.fromJson({
      "uuid": '123',
      "title": 'hello',
      "sizes": [
        {"name": 'adsa', "price": 1, 'uuid': 'uuid'}
      ]
    });
    expect(
      _singlePizza,
      equals(
        const SinglePizza(uuid: '123', title: 'hello', sizes: [
          PizzaSize(name: 'adsa', price: 1.0, uuid: 'uuid'),
        ]),
      ),
    );
  });
  test('Ingredient fromJson', () {
    var _singlePizza =
        Ingredient.fromJson({"enabled": true, "name": 'hello', 'uuid': 'uuid'});
    expect(
      _singlePizza,
      equals(
        const Ingredient(enabled: true, name: 'hello', uuid: 'uuid'),
      ),
    );
  });
}

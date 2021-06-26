# admin_app

On start we need to run build runner to create classes for json models

Run in console
```bash
flutter pub run build_runner build
```

After need only watching models by(console must stay opened)
```bash
flutter pub run build_runner watch
```

```bash
lib
├── bloc -> state of app
├── data ->  data providers
├── widgets -> mini widgets
├── common -> common styles and constants
├── models -> data models (use freezed )
├── repository -> combiner of data provider
├── utils -> any utils and extensions
│   └── logger.dart
└── main.dart -> entry point
```


for test coverage clean generated files run
```bash
dart  run remove_from_coverage:remove_from_coverage -f coverage/lcov.info -r '.g.dart$' -r '.freezed.dart$'
```
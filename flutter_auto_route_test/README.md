# flutter_auto_route_test

[auto_route](https://github.com/Milad-Akarie/auto_route_library) nested routes works.

Important API to navigate to nested route mentioned in the the [issue's comment](https://github.com/Milad-Akarie/auto_route_library/issues/1241#issuecomment-1260812671) not in the auto_route document yet.

```dart
          context.router
              .navigate(const DashboardRoute(children: [UserRoute()]));
```

## Run

watch

`flutter pub run build_runner watch`

run

`flutter run -d chrome`

## Demo

![demo](demo.gif 'demo')

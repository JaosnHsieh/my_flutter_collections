# flutter_auto_route_auth_guard_deep_links_workaround

Deep links, query strings, and auth guard with [auto_route](https://github.com/Milad-Akarie/auto_route_library) and [uni_link](https://github.com/avioli/uni_links).

## Run

Start android app

`flutter run -d your-android-id`

Go to home page that running the app in background.

Open another terminal and run deep link testing

### android app link

```bash
adb shell 'am start -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "http://flutterbooksample.com/#/dashboard/user?id=deepLinkworks&from=external" com.example.flutter_auto_route_test'
```

### android deep link

```bash
adb shell 'am start -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "logrckt://flutterbooksample.com/#/dashboard/user?id=deepLinkworks&from=external" com.example.uni_links_example'
```

## references

https://github.com/Milad-Akarie/auto_route_library/issues/461

https://github.com/avioli/uni_links/tree/master/uni_links

https://github.com/himanshusharma89/uni_links_example

https://blog.logrocket.com/understanding-deep-linking-flutter-uni-links/

https://developer.android.com/training/app-links

## Main Code

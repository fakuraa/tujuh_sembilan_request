# tujuh_sembilan_request 🚀

A modern Flutter project template featuring secure storage, clean architecture, network handling with Dio, and smooth state management with GetX.

---

## 📦 Project Info

- **Project Name**: `tujuh_sembilan_request`
- **Flutter SDK**: `>=3.7.0`
- **Version**: `0.1.0`
- **Publish**: Not published (`publish_to: 'none'`)

---

## 🧰 Tech Stack

| Feature         | Package                          |
|----------------|----------------------------------|
| State Management & Routing | [GetX](https://pub.dev/packages/get) |
| Network Client  | [Dio](https://pub.dev/packages/dio) |
| Secure Storage  | [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage) |
| Forms & Validation | [flutter_form_builder](https://pub.dev/packages/flutter_form_builder), [form_builder_validators](https://pub.dev/packages/form_builder_validators) |
| UI Enhancements | [flutter_svg](https://pub.dev/packages/flutter_svg), [autoscale_tabbarview](https://pub.dev/packages/autoscale_tabbarview) |

---

## 🖼️ Assets and Fonts

**Font Used**: [Plus Jakarta Sans](https://plusjakarta.art/)  
**Assets Included**:
- `assets/images/`
- `assets/icons/`
- Custom fonts located in `assets/fonts/`

```yaml
flutter:
  uses-material-design: true
  assets:
    - assets/images/
    - assets/icons/
  fonts:
    - family: PlusJakarta
      fonts:
        - asset: assets/fonts/PlusJakartaSans-Regular.ttf
        - asset: assets/fonts/PlusJakartaSans-Medium.ttf
          weight: 500
        - asset: assets/fonts/PlusJakartaSans-SemiBold.ttf
          weight: 600
        - asset: assets/fonts/PlusJakartaSans-Bold.ttf
          weight: 700
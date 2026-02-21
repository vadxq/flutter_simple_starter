# 依赖基线（Flutter 3.41）

更新时间：2026-02-19

## 1. 版本策略

- Flutter：`3.41.x`（`.fvmrc` 固定 `3.41.0`）。
- Dart：`>=3.11.0 <4.0.0`。
- 采用 Pub Workspace，所有本地模块包统一解析。
- 依赖升级节奏：每季度一次常规升级，安全问题随时升级。

## 2. 当前推荐基线（已在仓库落地）

### 根应用

- `flutter_riverpod: ^3.2.1`
- `go_router: ^17.1.0`
- `melos: ^7.4.0`
- `flutter_lints: ^6.0.0`

### 核心包 `app_core`

- `dio: ^5.9.1`
- `shared_preferences: ^2.5.4`
- `flutter_secure_storage: ^10.0.0`

## 3. 规划中可选基线（按场景启用）

- 路由代码生成：`go_router_builder: ^4.2.0`
- 本地数据库（复杂离线场景）：
  - `drift: ^2.31.0`
  - `drift_flutter: ^0.2.6`

## 4. 升级门禁

每次升级必须至少通过以下检查：

1. `dart run melos run format_check`
2. `dart run melos run analyze`
3. `dart run melos run test`
4. `flutter run --dart-define=APP_ENV=dev` 冒烟
5. iOS + Android 真机/模拟器基础回归

## 5. 参考来源

- `go_router`：https://pub.dev/packages/go_router
- `flutter_riverpod`：https://pub.dev/packages/flutter_riverpod
- `melos`：https://pub.dev/packages/melos
- `dio`：https://pub.dev/packages/dio
- `shared_preferences`：https://pub.dev/packages/shared_preferences
- `flutter_secure_storage`：https://pub.dev/packages/flutter_secure_storage
- `drift`：https://pub.dev/packages/drift
- `drift_flutter`：https://pub.dev/packages/drift_flutter

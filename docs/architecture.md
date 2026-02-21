# Single App + Modular Packages + Workspace 架构说明

## 1. 目标

本项目采用以下稳定模式：

- **Single App**：仓库只有一个可运行应用，入口在 `lib/main.dart`。
- **Modular Packages**：按职责拆分 `packages/*`，模块边界清晰。
- **Workspace**：使用 Pub Workspace 统一本地包解析，使用 Melos 统一工程命令。

## 2. 分层约束

### 2.1 App 组装层（根 `lib/`）

- `lib/app/bootstrap/`：启动链路与全局初始化。
- `lib/app/router/`：路由定义、守卫、导航策略。
- `lib/app/shell/`：底部导航壳与 Tab 页面。

### 2.2 模块层（`packages/*`）

- `app_core`：环境、网络、存储、错误与可观测性基建。
- `design_system`：主题、tokens、通用组件。
- `feature_auth`：认证能力（domain/data/application/presentation）。
- `feature_post`：帖子能力（domain/data/application/presentation）。
- `shared_contracts`：跨模块 DTO/命令对象。

## 3. 依赖方向

只允许以下方向：

`presentation -> application -> domain -> data`

补充规则：

- `shared_contracts` 只承载契约，不承载业务流程。
- `app_core` 不依赖任何 feature 包。
- feature 包之间禁止直接互相依赖内部实现。

## 4. 运行与交付

### 4.1 本地运行

```bash
dart pub get
dart run melos bootstrap
flutter run --dart-define=APP_ENV=dev
```

### 4.2 质量门禁

```bash
dart run melos run format_check
dart run melos run analyze
dart run melos run test
dart run melos run ci
```

## 5. 未来演进建议

- 新增业务时优先新增 `feature_xxx` 包，不向 app 组装层沉淀业务代码。
- 跨模块共享模型统一下沉到 `shared_contracts`。
- 观测、网络、安全策略优先在 `app_core` 收敛。

## 6. Flutter 3.41 维护策略

- 关注 3.41 已发布 breaking changes：
  - `containsSemantics` -> `isSemantics`
  - `findChildIndexCallback` -> `findItemIndexCallback`
  - Material 3 token 更新
  - 变量字体 `FontWeight` 行为变更
- 升级流程固定为：`doctor -> fix -> deps_outdated -> ci -> 双平台回归`。
- Android 先保持 AGP 8.x 稳定线，等待 Flutter 官方对 AGP 9 迁移限制解除。

# Flutter 3.41 应用规划（iOS + Android）

更新时间：2026-02-19

## 1. 目标与边界

本规划针对一个主产品 App，同时覆盖 iOS 与 Android，目标是：

- 统一代码主干，避免多 App 分叉。
- 保持业务模块可独立演进。
- 在 Flutter 3.41 之后，持续吸收新能力且可控升级。

## 2. 架构拍板

采用：**Single App + Modular Packages + Workspace**。

- Single App：一个运行入口，降低平台发布复杂度。
- Modular Packages：业务按领域拆包，边界清晰。
- Workspace：统一依赖解析与工程命令，避免版本漂移。

## 3. 技术栈选择建议

## 3.1 必选栈

- 路由：`go_router`
- 状态管理：`flutter_riverpod`
- 网络：`dio`
- 安全存储：`flutter_secure_storage`
- 普通 KV：`shared_preferences`
- 工程管理：Pub Workspace + Melos

## 3.2 按场景启用

- 本地数据库（复杂离线）：`drift + drift_flutter`
- 路由生成（规模增大后）：`go_router_builder`
- 监控上报：先抽象 `ErrorReporter`，再接入三方平台

## 3.3 暂缓项

- Android AGP 9 迁移：官方文档当前标注在 Flutter 插件场景仍有限制，先保持 AGP 8.x 稳定线。

## 4. 平台专项策略

## 4.1 iOS

1. 生命周期采用 `UIScene` 方案（旧写法需迁移）。
2. 发布前做真机回归：冷启动、前后台切换、深链、推送跳转。
3. 安全策略：token 仅走 Keychain（通过 `flutter_secure_storage`）。

## 4.2 Android

1. 保持 Gradle/AGP/Kotlin 与 Flutter 模板兼容版本。
2. 重点验证 Predictive Back 手势链路。
3. 每次升级后做 ABI/包体与启动性能对比。

## 5. Flutter 3.41 升级动作

每次 Flutter 主版本升级，先执行以下流程：

1. `dart run melos run doctor`
2. `dart run melos run fix`
3. `dart run melos run deps_outdated`
4. `dart run melos run ci`
5. 双平台冒烟与关键业务回归

## 6. 90 天路线图（建议）

### 第 1 阶段（1-2 周）

- 固定 Flutter 3.41 与依赖基线。
- 完成路由、认证、基础埋点框架。

### 第 2 阶段（3-6 周）

- 核心业务闭环（列表/详情/提交）。
- 补齐单测 + Widget 测试。

### 第 3 阶段（7-10 周）

- iOS/Android 平台专项（返回手势、生命周期、性能）。
- 构建发布流水线。

### 第 4 阶段（11-12 周）

- 灰度与上线准备。
- 事故回滚演练与观测阈值校准。

## 7. 参考资料

- Flutter 3.41 发布：https://docs.flutter.dev/release/release-notes/release-notes-3.41.0
- What's new in Flutter 3.41：https://docs.flutter.dev/release/whats-new#11-february-2026-whats-new-in-flutter-341
- Breaking changes 索引：https://docs.flutter.dev/release/breaking-changes
- AGP 9 迁移说明：https://docs.flutter.dev/release/breaking-changes/migrate-to-agp-9
- UIScene 迁移说明：https://docs.flutter.dev/release/breaking-changes/uiscenedelegate

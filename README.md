# flutter_simple_starter

基于 **Single App + Modular Packages + Workspace** 的 Flutter 架构模板（Flutter 3.41 基线）。

## 架构原则

- 只保留一个可运行应用（根目录）。
- 按领域拆分模块包（`packages/*`）。
- 用 Pub Workspace + Melos 统一依赖与工程命令。

## 目录结构

```text
lib/                      # 单 app 入口与组装层
test/                     # 单 app 测试
packages/
  app_core/               # 环境/网络/存储/错误基建
  design_system/          # 主题与通用组件
  feature_auth/           # 认证模块
  feature_post/           # 帖子模块
  shared_contracts/       # 跨模块契约
docs/
  architecture.md         # 架构文档
  flutter_3_41_planning.md # 3.41 技术栈与平台规划
  platform_release_checklist.md # iOS/Android 发布检查清单
  dependency_baseline.md  # 依赖基线
  implementation_task_log.md
  verification_report.md
  old/                    # 历史归档文档
```

## 快速开始

```bash
dart pub get
dart run melos bootstrap
dart run melos run ci
flutter run --dart-define=APP_ENV=dev
```

## 常用命令

```bash
dart run melos run format
dart run melos run format_check
dart run melos run fix
dart run melos run analyze
dart run melos run test
dart run melos run deps_outdated
dart run melos run ci
```

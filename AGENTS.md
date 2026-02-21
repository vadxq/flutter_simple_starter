# Repository Guidelines

## Project Structure & Module Organization
- Workspace root uses Pub Workspaces + Melos.
- App entrypoint is `lib/main.dart`.
- App composition lives under `lib/app/` (`bootstrap/`, `router/`, `shell/`).
- Shared capabilities are in `packages/`:
  - `packages/app_core`: env/network/storage/observability/result
  - `packages/design_system`: theme/tokens/common widgets
  - `packages/feature_auth`: auth feature (presentation/application/domain/data)
  - `packages/feature_post`: post feature (presentation/application/domain/data)
  - `packages/shared_contracts`: cross-package DTO/contracts
- App tests are in `test/`; package tests are in each `packages/*/test/`.
- Generated files (`*.g.dart`, `*.freezed.dart`) are committed but must not be edited manually.

## Build, Test, and Development Commands
- `dart pub get` installs root dependencies.
- `dart run melos bootstrap` installs workspace dependencies.
- `dart run melos run format` formats all packages.
- `dart run melos run analyze` runs static checks.
- `dart run melos run test` runs workspace tests.
- `dart run melos run ci` runs full CI checks locally.
- `flutter run --dart-define=APP_ENV=dev` starts app in dev mode.

## Coding Style & Naming Conventions
- Use Dart defaults: 2-space indentation and trailing commas where formatter applies.
- Run `dart format .` before committing.
- Prefer `snake_case` filenames and directories; classes/enums use `UpperCamelCase`; methods/fields use `lowerCamelCase`.
- Keep provider names descriptive and suffixed with `Provider` when applicable.
- Prefer relative imports (enforced by lint rules).

## Testing Guidelines
- Use `flutter_test` (`test` and `testWidgets`) for unit/widget coverage.
- Name test files `*_test.dart` and mirror feature paths when possible.
- Add or update tests when changing routing, auth state, API parsing, or widget behavior.
- Before opening a PR, run `dart run melos run analyze` and `dart run melos run test`.

## Commit & Pull Request Guidelines
- Follow Conventional Commit style (`feat: ...`, `fix: ...`, `chore: ...`).
- Keep commits small and single-purpose.
- PRs should include: summary, issue, test evidence, and UI screenshots/videos when needed.

## Environment & Configuration Tips
- `.fvmrc` pins Flutter `3.41.0`; prefer `fvm flutter ...` if you use FVM.
- Use `--dart-define=APP_ENV=dev` for development and `APP_ENV=prod` for production-like runs/builds.

## 回复

- 使用中文交流和回复
- 文档使用中文 markdown 格式

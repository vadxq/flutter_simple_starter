# iOS / Android 发布检查清单

更新时间：2026-02-19

## 1. 通用检查

- [ ] `dart run melos run format_check`
- [ ] `dart run melos run analyze`
- [ ] `dart run melos run test`
- [ ] 关键链路冒烟（登录、列表、详情、退出）
- [ ] 崩溃上报链路可用（fatal/non-fatal）

## 2. iOS 检查

- [ ] `UIScene` 生命周期链路验证
- [ ] 前后台切换恢复状态验证
- [ ] 深链打开与参数解析验证
- [ ] 推送点击跳转验证（若已接入）
- [ ] 证书、签名、Bundle ID、版本号检查

## 3. Android 检查

- [ ] Predictive Back 返回行为验证
- [ ] 冷启动与热启动耗时对比
- [ ] 包体体积变化检查（AAB/APK）
- [ ] 混淆与符号映射文件归档
- [ ] 签名、版本号、targetSdk 配置检查

## 4. 上线前回归

- [ ] iOS 真机（至少 2 个系统版本）
- [ ] Android 真机（至少 2 个品牌）
- [ ] 网络弱网与离线场景验证
- [ ] 发布后监控阈值与告警策略确认

# yuhao-assess-data

宇浩測評工具的數據文件倉庫。

## 📁 文件說明

本倉庫僅包含**大型數據文件**，用於 CDN 加載。

| 文件名                          | 大小   | 說明                       |
| ------------------------------- | ------ | -------------------------- |
| charAbsoluteFrequencyZhihu.json | 114KB  | 知乎語料字頻數             |
| charAbsoluteFrequencySC.json    | 214KB  | 北語簡體字頻數             |
| charAbsoluteFrequencyTC.json    | 93KB   | 臺灣繁體字頻數             |
| charAbsoluteFrequencyGuji.json  | 143KB  | 古籍語料字頻數             |
| wordAbsoluteFrequencySC.json    | 243KB  | 簡體詞頻數                 |
| charsets.json                   | 672KB  | 字符集定義                 |
| schemes/*.json                  | ~240KB | 內置方案配置文件和測評結果 |
| tables/*.txt                    | ~100KB | 碼表文件                   |

**配置文件已移至主倉庫**（2026-02-04）：

- `cjkBlocks.json` → `yuhao-assess/public/settings/`
- `codeTableConfig.json` → `yuhao-assess/public/settings/`
- `equivTable.json` → `yuhao-assess/public/settings/`

**術語說明**：

- **頻數（Absolute Frequency）**：出現次數（整數），如「的」出現 1000 次
- **頻率（Relative Frequency）**：出現比例（小數），如「的」佔 0.05（5%）

## 🔄 更新方式

### 覆蓋式更新（推薦）

每次更新直接覆蓋文件，無需保留歷史：

```bash
# 1. 更新文件
cp new-data/*.json .

# 2. 提交（使用 --amend 覆蓋上次提交）
git add .
git commit --amend -m "Latest data snapshot $(date +%Y-%m-%d)"

# 3. 強制推送
git push -f origin main
```

### 定期清理歷史（可選）

如果累積了太多歷史版本：

```bash
# 創建新的孤立分支（無歷史）
git checkout --orphan latest_branch

# 添加所有文件
git add -A
git commit -m "Latest data snapshot"

# 刪除舊分支並重命名
git branch -D main
git branch -m main

# 強制推送
git push -f origin main
```

## 🌐 使用方式

在 [yuhao-assess](https://github.com/forfudan/yuhao-assess) 中通過以下方式加載：

**開發環境**：

```typescript
// 使用本地文件
const data = await fetch('/data/charAbsoluteFrequencySC.json').then(r => r.json())
```

**生產環境**：

```typescript
// 從 GitHub Pages 加載
const CDN_URL = 'https://zhuyuhao.com/yuhao-assess-data/'
const data = await fetch(CDN_URL + 'charAbsoluteFrequencySC.json').then(r => r.json())
```

## 📊 總大小

約 **1.5MB**（9 個文件）

---

**維護者**：@forfudan  
**更新時間**：{{ 自動更新 }}

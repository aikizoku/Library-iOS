# 個人的に便利なロジックを集めたやつ、またの名を備忘録

## 方針

実際にプロダクトを開発して、その結果生まれた機能のみを入れる

省略できるコードは省略していくが、可読性を落とす省略はしない

このライブラリは、可能な限りnilを意識しないで使えるようにする（Swiftっぽく）

## Cocoapods

インストール
```
sudo gem install -n /usr/local/bin cocoapods
```

セットアップ
```
pod setup
```

Podfile作成
```
pod init
```

ライブラリのインストール
```
pod install
```

ライブラリのアップデート
```
pod update
```

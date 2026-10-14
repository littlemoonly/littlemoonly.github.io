# littlemoonly.github.io

使用 [Hugo](https://gohugo.io/) 和 [Typo](https://github.com/tomfran/typo) 搭建的个人博客。

## 本地预览

```bash
git submodule update --init --recursive
hugo server -D
```

打开 <http://localhost:1313/>。

## 新建文章

```bash
hugo new content posts/my-post.md
```

推送到 `main` 后，GitHub Actions 会构建并发布站点。

迁移前的 Hexo 静态站完整保存在本地分支 `legacy-hexo-site`。

#!/usr/bin/env ruby

require "fileutils"
require "nokogiri"

POSTS = [
  {
    source: "2026/03/13/矩阵LU分解/index.html",
    target: "content/posts/矩阵LU分解.html",
    title: "矩阵的LU分解",
    date: "2026-03-13T00:21:01+08:00",
    url: "/2026/03/13/矩阵LU分解/",
    summary: "Doolittle 法下矩阵 LU 分解的概念、计算公式与示例。",
    tags: ["线性代数"]
  },
  {
    source: "2026/03/13/线性代数基础知识/index.html",
    target: "content/posts/线性代数基础知识.html",
    title: "线性代数基础知识",
    date: "2026-03-13T00:19:38+08:00",
    url: "/2026/03/13/线性代数基础知识/",
    summary: "线性代数的基础概念与常用结论。",
    tags: ["Linear Algebra"]
  },
  {
    source: "2026/03/13/矩阵奇异值分解/index.html",
    target: "content/posts/矩阵奇异值分解.html",
    title: "奇异值分解的构造性证明",
    date: "2026-03-13T00:17:47+08:00",
    url: "/2026/03/13/矩阵奇异值分解/",
    summary: "任意实矩阵奇异值分解存在性的构造性证明。",
    tags: ["Linear Algebra"]
  },
  {
    source: "2026/03/13/Rayleigh商/index.html",
    target: "content/posts/Rayleigh商.html",
    title: "Rayleigh quotion",
    date: "2026-03-13T00:16:43+08:00",
    url: "/2026/03/13/Rayleigh商/",
    summary: "Rayleigh 商的定义、几何解释与相关性质。",
    tags: ["Linear Algebra"]
  }
].freeze

def legacy_file(path)
  IO.popen(["git", "show", "legacy-hexo-site:#{path}"], &:read)
end

POSTS.each do |post|
  document = Nokogiri::HTML(legacy_file(post[:source]))
  article = document.at_css("div.e-content")
  abort "Article body not found in #{post[:source]}" unless article

  front_matter = <<~TOML
    +++
    title = #{post[:title].inspect}
    date = #{post[:date].inspect}
    author = "orange bear"
    summary = #{post[:summary].inspect}
    description = #{post[:summary].inspect}
    url = #{post[:url].inspect}
    tags = #{post[:tags].inspect}
    readTime = true
    showTags = true
    math = false
    toc = false
    +++

  TOML

  FileUtils.mkdir_p(File.dirname(post[:target]))
  File.write(post[:target], front_matter + article.inner_html + "\n")
end

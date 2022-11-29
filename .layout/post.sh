#!/bin/bash

cat << _EOF_
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://unpkg.com/@picocss/pico@latest/css/pico.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
        <style>
            .center {
                text-align: center;
            }
        </style>
        <title>${BLOG_TITLE}</title>
    </head>
    <body>
    <main class="container">
        <header>
            <nav>
                <ul>
                <li><strong><a href="/">${BLOG_TITLE}</a></strong></li>
                </ul>
                <ul>
                <li><a href="https://www.linkedin.com/in/gomes-fdr"><i class="fab fa-linkedin-in"></i></a></li>
                <li><a href="https://www.github.com/gomes-fdr"><i class="fab fa-github"></i></a></li>
                <li><a href="https://bolha.us/@gomes_fdr"><i class="fab fa-mastodon"></i></a></li>
                <li><a href="mailto:gomes.fdr@gmail.com"><i class="far fa-envelope"></i></a></li>
                <li><a href="https://gomes-fdr.github.io/feed"><i class="fas fa-rss"></i></a></li>
                </ul>
            </nav>
            $(if [ "$TAGNAME" ]; then echo "-> TAG == <a href=\"/tag/$TAGNAME\">$TAGNAME</a>"; fi)
            $(if [ "$PAGE_NUM" ]; then echo "-> <a href=\"/page/$PAGE_NUM.html\">Page $PAGE_NUM</a>"; fi)
        </header>
        <hr>
        <section>
            <div class="heading"><a href=""><span class="stamp">$(date -d "$POST_DATE_RFC822" +%m/%d/%Y)</span><h1 class="title">$POST_TITLE</h1></a></div>
            <a href="../" class="home">←</a><div class="contents">
            $(echo "$POST_CONTENTS")
            <div class="tags">$(for i in $TAGS; do echo "<a href=\"../tag/$i\">$i</a>"; done;)</div>
            </div>
        </section>
        <hr>
        <footer class="center">
            <small>2022 &#169; generated with <a href="https://github.com/hmngwy/jenny">jenny</a></small>
        </footer>
    </main>
  </body>
</html>
_EOF_
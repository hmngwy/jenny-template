#!/bin/bash

# Break apart the LIST payload
IFS='✂︎' read -r -a array <<< "$LIST"

function index_loop {
  for (( idx=${#array[@]}-1 ; idx>=0 ; idx-- )) ; do
    [ "${array[idx]}" ] && eval "${array[idx]} list_item"
  done
}

function list_item {
  if [ -z "$BREAK" ]; then
cat << _LOOP_
  <li class="post-link"><a href="$URL_PREFIX$POST_URL"><span class="stamp">$(date -d "$POST_DATE_RFC822" +%m/%d/%Y)</span> <span class="title">$POST_TITLE</span></a></li>
_LOOP_
  else
cat << _LOOP_
  <li class="post-link"><a href="./page/$BREAK.html">In page $BREAK</a></li>
_LOOP_
  fi
}

function nav {
  if [ "$PAGE_OLD" ] || [ "$PAGE_NEW" ]; then
cat << _NAV_
    <nav>
	$([ "$PAGE_NEW" ] && echo "<a href=\"$PAGE_NEW\">← NEWER</a>")
	$([ "$PAGE_OLD" ] && echo "<a href=\"$PAGE_OLD\">OLDER →</a>")
    </nav>
_NAV_
  fi
}

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
            ul li {
                list-style: none;
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
        $(if [ "$TAGNAME" ]; then echo "<header><a href=\"/tag/$TAGNAME\">TAG: $TAGNAME</a></header>"; fi)
        <ul>
            $(index_loop)
        </ul>
        <hr>
        <footer class="center">
            <small>2022 &#169; generated with [jenny](https://github.com/hmngwy/jenny)</small>
        </footer>
    </main>
  </body>
</html>
_EOF_
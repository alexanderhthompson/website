BLOGS="$(cat blog-entries | awk -F', ' '!/^$/{ print "- "$1" ["$3"](blog/"$4")" }')"

cat templates/blog.md | awk -v blogs="$BLOGS" '{gsub(/\${blogs}/,blogs)}1'

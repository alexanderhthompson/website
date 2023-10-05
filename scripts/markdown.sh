
f=$1

MARKDOWN="pandoc --from markdown+auto_identifiers-smart --to html -s includes.yaml\
	--lua-filter=scripts/anchor-links.lua\
	--lua-filter=scripts/elem-ids.lua\
	--lua-filter=scripts/footnote-commas.lua\
	--citeproc"

PUB_DATE="$(cat blog-entries | grep $(basename $(dirname $f)) | awk -F, '{ print $1 }')"
MOD_DATE="$(cat blog-entries | grep $(basename $(dirname $f)) | awk -F, '{ print $2 }')"

if [ ! -z $PUB_DATE ] && [ ! -z $MOD_DATE ]; then
DATE_HTML="<ul class=\"blog-date\">\
<li>$PUB_DATE<\/li>\
<li style=\"font-style: italic;\">last updated $MOD_DATE<\/li>\
<\/ul>"
fi

$MARKDOWN $f | sed "s/\${date}/$DATE_HTML/"

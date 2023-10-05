BLOGS="$(cat blog-entries | awk -F', ' '!/^$/{\
	"date -d"$1" \"+%a, %d %b %Y 00:00:00 GMT\"" | getline date
	print "\
	<item>\n\
		<title>"$3"</title>\n\
		<description><![CDATA[ <a href=\"https://alec.freumh.org/blog/"$4"/\">https://alec.freumh.org/blog/"$4"/</a>]]></description>\n\
		<link>https://alec.freumh.org/blog/"$4"/</link>\n\
		<guid>https://alec.freumh.org/blog/"$4"/</guid>\n\
		<pubDate>"date"</pubDate>\n\
	</item>"\
}')"

cat templates/rss.xml | awk -v blogs="$BLOGS" '{gsub(/\${blogs}/,blogs)}1'

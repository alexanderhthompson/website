all: static/index.md static/rss.xml pandoc

clean:
	rm static/index.md static/rss.xml
	make -f makefile-pandoc clean

pandoc:
	make -f makefile-pandoc

# blog post entry creation

static/index.md:
	./scripts/create-blog-index.sh > static/index.md

static/rss.xml:
	./scripts/create-blog-rss.sh > static/rss.xml

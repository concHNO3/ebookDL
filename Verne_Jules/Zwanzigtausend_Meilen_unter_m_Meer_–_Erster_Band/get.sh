#!/bin/zsh

TITLE="Zwanzigtausend Meilen unter'm Meer – Erster Band"
URL="http://gutenberg.spiegel.de/buch/4024/";
LAST=25;

for i in {2..25};
	do
	curl "$URL"$i \
       	| sed -e '1,/div id="gutenb"/d' \
	| sed '/div/,$d' \
	| sed 's/h1/h2/g;s/h3/h2/g;s/h4/h2/g;s/h5/h2/g;/Capitel/d' \
	> $i.html;
	echo $i.html >> _liste;
done;
pandoc -f html -t epub -o "$TITLE".epub -s $(cat _liste);
	
rm _liste *.html

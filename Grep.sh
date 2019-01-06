#!/bin/sh
#Yeah I know........ echo overkill, but what did you except really when I made this here script for a simple Grep expression... should have set off some alarm bells.
echo ""
echo "Assignment question: Count all the lines in the book ""On the various forces of nature and their relations to each other by Michael Farday, where the first character is not a capital M"
echo ""
echo "Expression = grep -c -v -o '^[M]' 5593-0.txt"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "Book word count =" $(wc -l 52293-0.txt)
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "Total without [M] =" $(grep -c -v -o '^[M]' 52293-0.txt)
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "Total occurrences of [M] =" $(grep -c -o '^[M]' 52293-0.txt)
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "Total occurrences + lines without capital M = "$((56 + 9876)) "Original book word count."
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo ""
#Found it was nicer to use Greps built-in count function rather than piping it too wc -l
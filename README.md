# irssi-scripts

This is just a dump of some irssi-scripts I use.

## emojis.pl
Converts "slack-emojis" - eg. `:slightly_smiling_face:` to unicode-characters: :slightly_smiling_face: '

Requires the file "emoji_list.pl in the scripts dir.

Also requires that you use a font which is able to display all the characters.  You can check this by looking at the file emoji_list in your terminal.  If you can see all the symbols, you are good to go.

Works for both input and output.  

So you can type `:thumbsup:` in irssi, and the unicode-character U+1F44D will be sent to the server.

And if someone writes `:thumbsup:` in a channel or msg, you will see the appropriate unicode character :thumbsup: in your client


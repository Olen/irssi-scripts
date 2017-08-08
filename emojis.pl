use Irssi;
# use Irssi::Irc;
use strict;
use vars qw($VERSION %IRSSI);


$VERSION="2.0";

%IRSSI = (
        authors         => 'Ola Thoresen',
        contact         => 'irssi@olen.net',
        name            => 'message_cleaner',
        description     => 'Coverts emojo',
        license         => 'GPL v2'
);

my $emoji_in = 0;
my $emoji_out = 0;
my %emojis = do 'emoji_list.pl';
my $check = join '|', keys %emojis;

sub convert_emoji_in {
        if (!$emoji_in) {
                my $emitted_signal = Irssi::signal_get_emitted();
                my ($server, $data, $nick, $address) = @_;
                my ($target, $text) = split(/ :/, $data, 2);

		$text =~ s/:($check):/$emojis{$1}/go;

                $data = "$target :$text"; 
                $emoji_in = 1;
                Irssi::signal_emit("$emitted_signal", $server, $data, $nick, $address);
                Irssi::signal_stop();
                $emoji_in = 0;
        }
}

sub convert_emoji_out {
        if (!$emoji_out) {
                my $emitted_signal = Irssi::signal_get_emitted();
                my ($text, $dummy1, $dummy2) = @_;

		$text =~ s/:($check):/$emojis{$1}/go;

                $emoji_out = 1;
                Irssi::signal_emit("$emitted_signal", $text, $dummy1, $dummy2 );
                Irssi::signal_stop();
                $emoji_out = 0;
        }
}



Irssi::signal_add("event privmsg", "convert_emoji_in");
Irssi::signal_add("send command", "convert_emoji_out");





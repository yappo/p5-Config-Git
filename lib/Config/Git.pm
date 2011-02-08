package Config::Git;
use strict;
use warnings;
our $VERSION = '0.01';

1;
__END__

=head1 NAME

Config::Git - read gitconfig files

=head1 SYNOPSIS

in $HOME/.gitconfig

    [foo]
        a = true
        k = false
        b = 
    [github]
        user = yappo

in .git/config

    [foo]
        48 = true;
    [remote "origin"]
        url = git@github.com:yappo/p5-Config-Git.Git
        fetch = +refs/heads/*:refs/remotes/origin/*

in your code

    use Config::Git;

    my $conf = Config::Git->load; # load $HOME/.gitconfig and .git/config
    my $conf = Config::Git->load('.myconfig'); # load .myconfig
    my $conf = Config::Git->load_with('.myconfig'); # load $HOME/.gitconfig, .git/config and .myconfig

    $conf->get('github.user'); # yappo
    $conf->get_global('github.user'); # yappo

    $conf->get('remote.origin.url'); # git@github.com:yappo/p5-Config-Git.git
    $conf->get_global('remote.origin.url'); # undef

    $conf->is_true('foo.a'); # 1
    $conf->is_true('foo.k'); # 0
    $conf->is_true('foo.b'); # 0
    $conf->is_true('foo.48'); # 1

    $conf->is_true_global('foo.a'); # 1
    $conf->is_true_global('foo.k'); # 0
    $conf->is_true_global('foo.b'); # 0
    $conf->is_true_global('foo.48'); # 0

=head1 DESCRIPTION

Config::Git is git config file reader. It has not git config file editor.

=head1 METHODS

=head2 load()
=head2 load(@files)

=head2 load_with(@files)

=head2 get($key)
=head2 get_global($key)

=head2 is_true($key)
=head2 is_true_global($key)

=head2 to_hash()

=head1 AUTHOR

Kazuhiro Osawa E<lt>yappo {at} shibuya {dot} plE<gt>

=head1 SEE ALSO

L<Config::GitLike>, L<http://www.kernel.org/pub/software/scm/git/docs/git-config.html>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

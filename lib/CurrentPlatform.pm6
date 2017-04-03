use v6;

unit class CurrentPlatform is Distro;

=begin pod

=head1 NAME

CurrentPlatform - Ask questions about the platform the program is runnign on

=head1 SYNOPSIS

	use CurrentPlatform;

=head1 DESCRIPTION

The C<Distro> package (undocumented) uses information captured during
the compilation of the virtual machine.

=end pod

method is-not-win   { ! self.is-win }

method is-osx       { $*DISTRO.name eq 'macosx' }
method is-not-win   { ! self.is-osx }

method is-unix      { self.is-linux || self.is-bsd }
method is-not-unix  { ! self.is-unix }

method is-linux     { ... }
method is-not-linux { ! self.is-linux }

method is-archlinux { ... }

method is-bsd       { ... }
method is-not-bsd   { ! self.is-bsd }

method is-freebsd   { ... }
method is-openbsd   { ... }

method is-vms       { False }

=begin pod


=end pod

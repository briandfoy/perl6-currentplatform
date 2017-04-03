use v6;

unit class CurrentPlatform;

=begin pod

=head1 NAME

CurrentPlatform - Ask questions about the platform the program is runnign on

=head1 SYNOPSIS

	use CurrentPlatform;

=head1 DESCRIPTION

The C<Distro> package (undocumented) uses information captured during
the compilation of the virtual machine.

=head2 Methods

=item is-win

Returns True is the operating system is Windows. This includes Cygwin.

=item is-not-win

Returns True is the operating system is anything but Windows.

=end pod

sub name { $*DISTRO.name.lc };

my $Unix = any(<
	aix       bsdos        beos   bitrig  dgux      dragonfly  dynixptx
	freebsd   linux        haiku  hpux    iphoneos  irix       darwin
	machten   midnightbsd  minix  mirbsd  next      openbsd    netbsd
	dec_osf   nto          svr4   svr5    sco       sco_sv     unicos
	unicosmk  solaris      sunos  cygwin  msys      os2        interix
	gnu       gnukfreebsd  nto    qnx     android
	>);

my $Linux = any(<
	linux ubuntu
	>);

my $BSD = any(<
	dragonfly dragonfly midnightbsd mirbsd openbsd netbsd gnukfreebsd
	>);

my $Windows = any(<
	bsdos cygwin mswin32 os2 win32
	>);


method is-win        {   name() eq $Windows }
method is-not-win    { ! self.is-win        }

method is-cygwin     {   name() eq 'cygwin' }
method is-not-cygwin { ! name() eq 'cygwin' }

=begin pod

=item is-osx

Returns True is the operating system is Mac OS X

=item is-not-osx

Returns True is the operating system is anything but Mac OS X

=end pod

method is-osx       { name() eq 'macosx' }
method is-not-osx   { ! self.is-osx }

method is-unix      { name() eq $Unix }
method is-not-unix  { ! self.is-unix }

method is-linux     { name() eq $Linux }
method is-not-linux { ! self.is-linux }

method is-archlinux { ... }
method is-ubuntu    { name() eq 'ubuntu' }

method is-bsd       { name() eq $BSD }
method is-not-bsd   { ! self.is-bsd }

method is-freebsd   { name() eq 'freebsd' }
method is-openbsd   { name() eq 'openbsd' }
method is-netbsd    { name() eq 'netbsd'  }
method is-dragonfly { name() eq 'dragonfly'  }

method is-vms       { False }

=begin pod


=end pod

package OO1;

sub new {
  my ($class, %args) = @_;
  return bless {
    quiet => exists $args{quiet} ? $args{quiet} : 0,
    paths => exists $args{paths} ? $args{paths} : [],
    names => exists $args{names} ? $args{names} : {},
  }, $class;
}

1;

abstract class Sample {
  final bool loader;
  const Sample(this.loader);
}

class SampleInitState extends Sample {
  SampleInitState(bool val) : super(false);
}

class SampleResultState extends Sample {
  SampleResultState(bool val) : super(val);
}

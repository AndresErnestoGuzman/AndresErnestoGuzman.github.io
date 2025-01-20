use feature 'say';
@files=split(/\s+/,`ls -1 *png`);

say '<html>
<head>
<style>
div.gallery {
  margin: 5px;
  border: 1px solid #ccc;
  float: left;
  width: 400px;
}

div.gallery:hover {
  border: 1px solid #777;
}

div.gallery img {
  width: 100%;
  height: auto;
}

div.desc {
  padding: 15px;
  text-align: center;
}
</style>
</head>
<body>';

 # uid___A001_X37c8_X23.SMC_Bar_center_sci.spw31.cube.I.sd.single_beam.preq182.png

foreach my $file (@files){
	@_ = split(/\./,$file);

	$_ = $file;
	if(/(uid[^\.]+)\.(\S+)_sci\.(spw[0-9]+).*/){($mous,$field,$spw) = ($1,$2,$3)}
	#($mous,$field,$spw,) = @_[0..2];
	$_ = $spw;s/spw/spw=/;$spw=$_;
	$_ = $mous;s/___/:\/\//;s/_/\//g; $mous = $_;
	$str = join('',("<div class=\"gallery\"><figure><img src=\"$file\" alt=\"_blank\">",
		"<figcaption><a target=\"_blank\" href=\"https://asa.alma.cl/qa2/qaMainPage.zul?ousStatusUid=$mous\">$mous</a>, $spw </figcaption>",
		"</figure><div class=\"desc\"> </div></div>"));
	say $str;
	#last;
}

say '</body>
</html>'
@files=split(/\s+/,`find . -name "*html"`);
foreach $file (@files){
    open(FF,$file);
    open(NF,">newfile");
    while(<FF>){
	s/andresguzman/andresguzman\//;
	print NF $_;
    }
    close NF; close FF;
    system "mv newfile $file";
    
}

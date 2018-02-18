class base::if {
	#if $::hostname =~ /^puppetnode(\d+)/ {
	if $::hostname =~ /^puppetnode/ {
		notice("You have arrived at server $0 ")
	}
}

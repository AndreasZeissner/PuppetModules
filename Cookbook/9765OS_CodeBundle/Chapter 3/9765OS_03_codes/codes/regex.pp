if $::lsbdistdescription =~ /LTS/ {
  notify { 'Looks like you are using a Long Term Support version of Ubuntu.': }
} else {
  notify {'You might want to upgrade to a Long Term Support version of Ubuntu...': }
}

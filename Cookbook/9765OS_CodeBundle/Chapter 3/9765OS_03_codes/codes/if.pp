if $::operatingsystem == 'Ubuntu' {
  notify { 'Running on Ubuntu': }
} elsif $::operatingsystem == 'Debian' {
  notify { 'Close enough...': }
} else {
  notify { 'Non-Ubuntu system detected. Please upgrade to Ubuntu immediately.': }
}

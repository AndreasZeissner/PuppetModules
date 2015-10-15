define lunchprint() {
  notify { "Lunch included ${name}": }
}

$menu = 'egg beans chips'
$items = split($menu, ' ')
lunchprint { $items: }
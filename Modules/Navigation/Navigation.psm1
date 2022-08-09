function search($word) { Get-ChildItem *$word* }
function sdir($file) { Get-ChildItem -recurse -filter *$file* -Directory }
function sdirLeetCode ($file) { Get-ChildItem -recurse -filter "$file-*UI" -Directory }
function sfile($file) { Get-ChildItem -recurse -filter *$file* -File }
function mk($Name) { New-Item -ItemType File -Name $name }
function count($Name) { (Get-ChildItem *$name* | Measure-Object).Count }
function mkfiles($Number, $name) { for ($i = 1; $i -le $number; $i++ ) { mk $name$i.txt } }
function rmfiles($name) { $count = count $name; for ($i = 0; $i -lt $count; $i++) { Remove-Item $name* } }
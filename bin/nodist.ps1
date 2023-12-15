param($cmd,$ver,[Switch]$v)

[System.Environment]::SetEnvironmentVariable("NODE_TLS_REJECT_UNAUTHORIZED", 0, "User")
[System.Environment]::SetEnvironmentVariable("NODIST_PREFIX", $env:HOMEPATH + '\scoop\apps\nodist-portable\current', "User")
$env:NODIST_PREFIX = $env:HOMEPATH + '\scoop\apps\nodist-portable\current'

if ($cmd -eq "use" -or $cmd -eq "env") {
 	nodist.cmd add $ver
 	$env:NODIST_NODE_VERSION = $ver
 	echo $ver
}
elseif ($cmd -eq "npm" -and $ver -eq "env") {
 	nodist.cmd npm add $args[0]
 	$env:NODIST_NPM_VERSION = $args[0]
 	echo $args[0]
}
elseif ($v){
 	nodist.cmd -v
}
else {
 	nodist.cmd $cmd $ver ([string]$args)
}

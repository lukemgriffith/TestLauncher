
net use x: \\vboxsvr\TestLauncher
new-psdrive -Name share -PSProvider FileSystem -Root x:

$env:psmodulepath = $env:psmodulepath + "share:\modules"

import-module psake
import-module pester



. share:\launch.ps1
. share:\shutdown.ps1


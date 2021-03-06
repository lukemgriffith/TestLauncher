
function CheckProfileUpdate {

	$pcs = Get-FileHash $Profile
	$rcs = Get-FileHash share:\posh\Profile.ps1

	if ($pcs.hash -ne $rcs.hash) {

		Write-Verbose "Updating profile" -verbose
		copy-item share:\posh\Profile.ps1 $profile
		restart-computer
	}

}



net use x: \\vboxsvr\TestLauncher
new-psdrive -Name share -PSProvider FileSystem -Root x:


Start-Transcript -path "share:\transcripts\$(Get-Date -format "ddMMyyyy.HHmmss").txt"


CheckProfileUpdate




$env:psmodulepath = $env:psmodulepath + ";share:\modules" + ";share:\DevModules"

import-module psake
import-module pester




. share:\posh\launch.ps1

Stop-Transcript

. share:\posh\shutdown.ps1



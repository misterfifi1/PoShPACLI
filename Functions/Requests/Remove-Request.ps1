﻿Function Remove-Request {

	<#
    .SYNOPSIS
    	Removes a request from the requests list. If the request is removed from 
        the MY_REQUEST list, it is deleted. If it is removed from the 
        INCOMING_REQUEST list, the user who issued this function will not be able 
        to see it, but other authorized users will be able to.

    .DESCRIPTION
        Exposes the PACLI Function: "DELETEREQUEST"

    .PARAMETER vault
        The name of the Vault containing the specified Safe.

    .PARAMETER user
        The Username of the User carrying out the task.

    .PARAMETER safe
        The name of the Safe for which the request has been created.
    
    .PARAMETER requestID
        The unique ID number of the request.
    
    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is â€˜0â€™.

    .EXAMPLE
    	A sample command that uses the function or script, optionally followed
    	by sample output and a description. Repeat this keyword for each example.

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: July 2017
    #>
    
	[CmdLetBinding(
		SupportsShouldProcess = $True
	)]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$safe,
		[Parameter(Mandatory = $True)][string]$requestID,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If (!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}
    elseif( $PSCmdlet.ShouldProcess($($PSBoundParameters.getEnumerator()))) {
        Write-Output 'Would process command Invoke-PACLICommand $pacli DELETEREQUEST'
    }

	Else {

		#$PACLI variable set to executable path
                    
		$Return = Invoke-PACLICommand $pacli DELETEREQUEST $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)
        
		if ($Return.ExitCode) {
			Write-Debug $Return.StdErr
			Write-Output $FALSE
		}
		else {
			Write-Output $TRUE
            
		}
        
	}

}

<#
copiara solo archivos modificados(o nuevos) de 
C:\xampp\htdocs\restaurante\...  ->  F:\xampp\htdocs\restaurante\...  
#>

#Clear-Host;
$v  = Get-Volume
foreach($i in $v.driveletter)
{
    if($i -eq "F")
    {        
        $archivos = Get-ChildItem -Path . -Recurse | Where-Object{$_.LastWriteTime -gt (Get-Date).AddHours(-24)}

        foreach($item in $archivos)
        {
            $file = "$($item.Directory)\$($item.name)"; 
            if(Test-Path -Path $file -PathType Leaf)
            {
                $arc  = "F" + $file.Substring(1, $file.Length - 1);
                try 
                {
                    $arc
                    Copy-Item $file $arc -Confirm:$False 
                    
                }
                catch 
                {
                    Write-Host "Error: " $file -ForegroundColor Yellow; 
                }
            }
        }
        break
    }
}

<#
copiara solo archivos modificados(o nuevos) de 
C:\xampp\htdocs\restaurante\...  ->  F:\xampp\htdocs\restaurante\...  
#>

#Clear-Host;
$archivos = Get-ChildItem -Path c:\xampp\htdocs\restaurante -Recurse | Where-Object{$_.LastWriteTime -gt (Get-Date).AddHours(-24)};

foreach($item in $archivos)
{
    $file = "$($item.Directory)\$($item.name)"; 
    if(Test-Path -Path $file -PathType Leaf)
    {
        $arc  = "F" + $file.Substring(1, $file.Length - 1);
        try 
        {
            # Copy-Item $file $arc -Confirm:$False; 
            $arc
            
        }
        catch 
        {
            Write-Host "Error: " $file -ForegroundColor Yellow; 
        }
        # Write-Host $arc ; 
        # Write-Host $file; 
    }
}

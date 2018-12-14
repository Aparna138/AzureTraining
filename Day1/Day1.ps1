
[INT]$StartNumber = Read-Host -Prompt "Enter StartNumber"
[INT]$EndNumber= Read-Host -Prompt "Enter EndNumber"
[INT]$NoofLines=Read-Host -Prompt "Enter NoOflines"
[INT]$var1=Read-Host -Prompt "div1"
[INT]$var2=Read-Host -Prompt "div2"
[INT]$var3=Read-Host -Prompt "div3"
[INT]$Original=$StartNumber
$output=""
for ($StartNumber; $StartNumber -le $EndNumber; $StartNumber++)
{   
  if ( $StartNumber%var1 -eq 0 ) 
        { 
            $output="FiZZBUZZ"
        }
   elseif ($StartNumber%var2 -eq 0 )
        {
            $output="BUZZ"
        }
   elseif($StartNumber%var3 -eq 0)
       {
          $output="fizz"
       }
   else
       {
        $output=$StartNumber
       }
   if($StartNumber -ne $Original -and (($StartNumber-$Original)+$NoofLines)%$NoofLines -eq 0)
       {
            Write-Host `n 
       }
   Write-Host -NoNewline  $output `t  
          
  }
  

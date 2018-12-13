function  DisplayNumbers
{

[INT]$StartNumber = Read-Host -Prompt "Enter StartNumber"
[INT]$EndNumber= Read-Host -Prompt "Enter EndNumber"
[INT]$NoofLines=Read-Host -Prompt "Enter NoOflines"
[INT]$Original=$StartNumber
[INT]$Value=1;
$output=""
for ($StartNumber; $StartNumber -le $EndNumber; $StartNumber++)
{   
  if ( $StartNumber%15 -eq 0 ) 
        { 
            $output="FiZZBUZZ"
        }
   elseif ($StartNumber%5 -eq 0 )
        {
            $output="BUZZ"
        }
   elseif($StartNumber%3 -eq 0)
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
  }

  try
  {
  DisplayNumbers;
  }
  Catch
  {
  Write-Host $_.Exception.ToString()
  }

  

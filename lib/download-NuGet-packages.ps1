set-strictMode -version 3

add-Type -assembly System.IO.Compression.FileSystem

function download-NuGet-package {
   param (
      [string  ] $name,
      [string  ] $version,
      [string[]] $dllPaths
   )

   write-host "Downloading $name - $version"

   $downloadURL = "https://www.nuget.org/api/v2/package/$name/$version"
   invoke-webRequest $downloadURL -outFile $env:temp/nugetPkg.zip
   $zip = [IO.Compression.ZipFile]::OpenRead("$env:temp/nugetPkg.zip")

   foreach ($dllPath in $dllPaths) {
      $dllName = $dllPath -replace '.*[/\\](.*)', '$1'
      [IO.Compression.ZipFileExtensions]::ExtractToFile($zip.GetEntry($dllPath), "$psScriptRoot/$dllname")
   }

   $zip.Dispose()
}


download-NuGet-package BouncyCastle                                             1.8.9     lib/BouncyCastle.Crypto.dll
download-NuGet-package itext7.commons                                           7.2.0     lib/net461/itext.commons.dll
download-NuGet-package itext7                                                   7.2.0     lib/net461/itext.kernel.dll, lib/net461/itext.io.dll, lib/net461/itext.layout.dll
download-NuGet-package Microsoft.Bcl.AsyncInterfaces                            5.0.0     lib/net461/Microsoft.Bcl.AsyncInterfaces.dll
download-NuGet-package Microsoft.Extensions.Logging                             5.0.0     lib/net461/Microsoft.Extensions.Logging.dll
download-NuGet-package Microsoft.Extensions.DependencyInjection                 5.0.2     lib/net461/Microsoft.Extensions.DependencyInjection.dll
download-NuGet-package Microsoft.Extensions.DependencyInjection.Abstractions    5.0.0     lib/net461/Microsoft.Extensions.DependencyInjection.Abstractions.dll
download-NuGet-package Microsoft.Extensions.Logging.Abstractions                5.0.0     lib/net461/Microsoft.Extensions.Logging.Abstractions.dll
download-NuGet-package Microsoft.Extensions.Options                             5.0.0     lib/net461/Microsoft.Extensions.Options.dll
download-NuGet-package Microsoft.Extensions.Primitives                          5.0.0     lib/net461/Microsoft.Extensions.Primitives.dll
download-NuGet-package System.Threading.Tasks.Extensions                        4.5.4     lib/net461/System.Threading.Tasks.Extensions.dll
download-NuGet-package System.Memory                                            4.5.4     lib/net461/System.Memory.dll
download-NuGet-package System.Runtime.CompilerServices.Unsafe                   5.0.0     lib/net45/System.Runtime.CompilerServices.Unsafe.dll
download-NuGet-package System.Diagnostics.DiagnosticSource                      5.0.1     lib/net46/System.Diagnostics.DiagnosticSource.dll
download-NuGet-package System.ValueTuple                                        4.5.0     lib/net461/System.ValueTuple.dll

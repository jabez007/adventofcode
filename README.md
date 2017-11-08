# adventofcode-2017

Using [C#](https://learn.microsoft.com/dotnet/csharp/) for [2017's Advent of Code](https://adventofcode.com/2017).

Use C# 7.2, the last stable C# language version available by December 31, 2017.
See [Microsoft's C# version history](https://learn.microsoft.com/dotnet/csharp/whats-new/csharp-version-history#c-version-72).

`global.json` selects .NET Core SDK 2.1.3, listed in [Microsoft's 2017 release metadata](https://github.com/dotnet/core/blob/main/release-notes/2.0/releases.json).
This SDK includes the .NET Core 2.0.4 runtime. The SDK version differs from the runtime and language versions.
Each `.csproj` sets `LangVersion` to `7.2` and targets `netcoreapp2.0` to keep language features and framework APIs within 2017.

Install the [.NET Core SDK 2.1.3 archive](https://builds.dotnet.microsoft.com/dotnet/Sdk/2.1.3/dotnet-sdk-2.1.3-linux-x64.tar.gz) for Linux x64.
Microsoft's release metadata also lists Windows and macOS downloads.
On Linux, this historical SDK needs OpenSSL 1.0.x and compatible ICU libraries.
Use a compatible environment when those libraries are unavailable on your host.

From the repository root, run:

```sh
dotnet --version
dotnet restore day01/Day01.csproj
dotnet build day01/Day01.csproj --no-restore
dotnet run --project day01/Day01.csproj --no-build
```

`dotnet --version` must report `2.1.3`.
The starter prints `Advent of Code 2017 - Day 01`. Replace it with your solution.
Keep each day's console project in its own directory, such as `day01/Day01.csproj`.
Copy the starter project for each new day and retain its `LangVersion` and `TargetFramework` values.

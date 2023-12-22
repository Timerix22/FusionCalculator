# FusionCalculator
The calculator written in [Fusion language](https://github.com/fusionlanguage/fut). Can be translated to C and C#. Can be compiled as executable or library.

### Building
Requirements: fut, bash, dotnet8 (for c#), gcc (for C)

Just generate C# source files:
```shell
./build_cs.sh --translate-only
```
Build C# executable:
```shell
./build_cs.sh
```
Build C executable:
```shell
./build_c.sh
```
Build C executable with debug symbols:
```shell
./build_c.sh --debug
```

## Executable usage
Just call exe file in bin/ with math expression arguments:
```shell
bin/FusionCalculator.exe 1+2
3
bin/FusionCalculator.exe '11/(99-88)'
1
bin/FusionCalculator.exe '-1+6*(-2)'
-13
```

## Library usage
The public interface is very simple:
```cs
namespace FusionCalculator {
  public static class Calculator {
    public static double Calculate(string);
  }
}
```
Just call Calculate and get the result!

# AppVeyor

Continuous Integration solution for Windows and Linux

## Build Versioning

```
version: '0.0.{build}'
```

## Assembly Patching

```
dotnet_csproj:
  patch: true
  file: '**\*.csproj'
  version: '{version}'
  package_version: '{version}'
  assembly_version: '{version}'
  file_version: '{version}'
  informational_version: '{version}'
```

## Cloning directory

```
clone_folder: c:\projects\<project-slug>
```

## Branches

Branches to build

```
branches:
  only:
    - master
```

## Tags

Do not build on tags (GitHub, Bitbucket, GitLab, Gitea)

```
skip_tags: true
```

## Images

scripts that are called at very beginning, before repo cloning

```
init:
  - git config --global core.autocrlf input
```

## Images

```
image: Visual Studio 2019
```

## Environment variables

```
global:
    connection_string: server=12;password=13;
    service_url: https://127.0.0.1:8090
```

## Caching

build cache to preserve files/folders between builds

```
cache:
  - packages -> **\packages.config
```

## Services

enable service required for build/tests

```
services:
  - mssql2014           # start SQL Server 2014 Express
  - mssql2014rs         # start SQL Server 2014 Express and Reporting Services
  - mssql2012sp1        # start SQL Server 2012 SP1 Express
  - mssql2012sp1rs      # start SQL Server 2012 SP1 Express and Reporting Services
  - mssql2008r2sp2      # start SQL Server 2008 R2 SP2 Express
  - mssql2008r2sp2rs    # start SQL Server 2008 R2 SP2 Express and Reporting Services
  - mysql               # start MySQL 5.6 service
  - postgresql          # start PostgreSQL 9.5 service
  - iis                 # start IIS
  - msmq                # start Queuing services
  - mongodb             # start MongoDB
```

## Build Configuration

```
# build platform, i.e. x86, x64, Any CPU. This setting is optional.
platform:
  - x64
  - Any CPU
configuration: Release
```

## Test Configuration

```
test:
  assemblies:
    - '**\*.tests.dll'

# Test only assemblies
test:
  # only assemblies to test
  assemblies:
    only:
      - test-assembly-A.dll
      - '**\*.tests.dll'

  # only categories to test
  categories:
    only:
      - A
      - B
# Test except assemblies
test:
  # all except assemblies to test
  assemblies:
    except:
      - test-assembly-A.dll
      - '**\*.tests.dll'

  # all except categories to test
  categories:
    except:
      - A
      - B
```

# Install apps

scripts that run after cloning repository

```
install:
  - ps: choco install dotnetcore-sdk
```

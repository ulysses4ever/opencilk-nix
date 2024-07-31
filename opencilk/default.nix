{ stdenv, fetchFromGitHub, cmake, python3 }:

stdenv.mkDerivation rec {
  pname = "opencilk";
  version = "2.1";
  srcs = [
    (fetchFromGitHub {
    owner = "OpenCilk";
    repo = "opencilk-project";
    rev = "refs/tags/opencilk/v${version}";
    sha256 = "sha256-Z4CjQU4wC0ubQSWaieDoMycxmhpPqnSEevMWQdRNUYY=";
    name = "opencilk";
    })
    (fetchFromGitHub {
    owner = "OpenCilk";
    repo = "cheetah";
    rev = "refs/tags/opencilk/v${version}";
    sha256 = "sha256-QUlH2mKftfJe4xjmGc3Cumgi8aqrtGVxDTmfXRX/cB4=";
    name = "cheetah";
    })
    (fetchFromGitHub {
    owner = "OpenCilk";
    repo = "productivity-tools";
    rev = "refs/tags/opencilk/v${version}";
    sha256 = "sha256-6+pUxNwkYUfORjeDzX5MJXzYwJbTodF019hVkDow+uQ=";
    name = "productivity-tools";
    })
    (fetchFromGitHub {
    owner = "OpenCilk";
    repo = "infrastructure";
    rev = "refs/tags/opencilk/v${version}";
    sha256 = "sha256-01o3apUzIwFubvgJu+aonp7Ly7AMDvZKkOV7sz0pXBU=";
    name = "infrastructure";
    })
  ];

  buildInputs = [
    cmake
    python3
  ];

  sourceRoot = ".";

  configurePhase = ''
    echo hello!!!
  '';

  buildPhase = ''
    echo hello again!
    ls -1
    mv ./cheetah opencilk/
    mv ./productivity-tools opencilk/cilktools
    ls -1
    infrastructure/tools/build $(pwd)/opencilk $out
  '';

}

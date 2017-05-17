# This file was generated by https://github.com/kamilchm/go2nix v1.2.0
{ stdenv, buildGoPackage, fetchFromGitHub, avahi, cups }:

# TODO: Add a service for gcp-cups-connector and perhaps some other
# kind of configuration for the same thing that gcp-connector-util
# provides.

buildGoPackage rec {
  name = "cloud-print-connector-unstable-${version}";
  version = "1.11";
  rev = "481ad139cc023a3ba65e769f08f277368fa8a5de";

  goPackagePath = "github.com/google/cloud-print-connector";

  src = fetchFromGitHub {
    owner = "google";
    repo = "cloud-print-connector";
    sha256 = "1vryhhv92bsncy1bsx9j4graz3sz9ddmizakv2fdrns09mmcgchm";
    rev = "v${version}";
  };

  goDeps = ./deps.nix;

  buildInputs = [ avahi cups ];

  meta = with stdenv.lib; {
    description = "Share printers from your Windows, Linux, FreeBSD or OS X computer with ChromeOS and Android devices, using the Cloud Print Connector";
    homepage = https://github.com/google/cloud-print-connector;
    license = licenses.bsd3;
    maintainers = with maintainers; [ hodapp ];
    # TODO: Fix broken build on OS X.  The GitHub presently lists the
    # FreeBSD build as broken too, but this may change in the future.
    platforms = platforms.linux;
  };
}
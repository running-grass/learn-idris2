
with import <nixpkgs> {};
mkShell {
  buildInputs = [
    # javascript
    nodejs
    yarn
	nodePackages.gulp-cli

  # idris2
  idris2
  idrisPackages.contrib 
  idrisPackages.pruviloj
  ];
}

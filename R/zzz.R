.onAttach <- function(libname, pkgname) {
  packageStartupMessage(
    "Welcome to the BrPolicorpus package! This package is part of my research project financed by CAPES and Alexandre Humboldt Foundation. Please, contact me **rll307@unicamp.br** if any doubts come up. Use download_index() for a complete list of data modules. Please cite this package if you use any of its data.
                        @software{BrPoliCorpus,
                          author = {Rodrigo Esteves {de Lima-Lopes}},
                          title = {BrPoliCorpus: Brazilian Political Corpus},
                          url = {https://github.com/rll307/BrPoliCorpus.git},
                          version = {1.0},
                          date = {2024-7-01},}"
  )
}

# Set default CRAN mirror to MIT
r = getOption('repos')
r['CRAN'] = "https://cran.mtu.edu"
options(repos = r)
rm(r)


# Disable 'save workspace image?' prompt..
library(utils)
assignInNamespace(
    "q",
    function(save = "no", status = 0, runLast = TRUE) {
        .Internal(quit(save, status, runLast))
    },
    "base"
)

# Nice colours
# devtools::install <- github("jalvesaq/colorout")
library(colorout)
# Automatically sets the value of options ("width") when the terminal emulator is resized.
library(setwidth)

# For vimcom for vim-r-plugin
if (interactive()) {
    # options(vimcom.verbose = 1) # optional
    if(Sys.getenv("VIMRPLUGIN_TMPDIR") != "")
        library(vimcom)
}

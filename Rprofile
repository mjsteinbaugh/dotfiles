# R Startup Profile
# Last modified 2018-09-18
# Tested on Linux, macOS, and Windows
#
# Stephen Turner's profile:
# http://gettinggeneticsdone.blogspot.com/2013/07/customize-rprofile.html
#
# Jim Hester's profile:
# https://github.com/jimhester/dotfiles/blob/master/R/Rprofile
#
# # Efficient R programming
# https://csgillespie.github.io/efficientR/set-up.html

# Notes ========================================================================
# Don't set `stringsAsFactors = FALSE`. Code will be non-portable!

# If devtools runs into an unzip error, set this:
# unzip = "/usr/bin/unzip"

# Check compilers are installed ================================================
if (identical(Sys.info()[["sysname"]], "Darwin")) {
    stopifnot(file.exists("/usr/local/clang6/bin/clang"))
    stopifnot(file.exists("/usr/local/gfortran/bin/gfortran"))
}

# Invisible utility functions ==================================================
# Assign shortcuts to a hidden environment.
.env <- new.env()

.env$BiocCheck <- function(package = ".", ...) {
    BiocCheck::BiocCheck(package = package, ...)
}

.env$build_home <- function(...) {
    pkgdown::build_home(...)
}

.env$build_news <- function(...) {
    pkgdown::build_news(...)
}

.env$build_reference <- function(...) {
    pkgdown::build_reference(...)
}

.env$build_site <- function(...) {
    pkgdown::build_site(...)
}

.env$check <- function(...) {
    devtools::check(...)
}

.env$cd <- function(...) {
    base::setwd(...)
}

.env$clear <- function() {
    cat("\f")
}

.env$dev <- function(...) {
    bb8::dev(...)
}

.env$document <- function(...) {
    devtools::document(...)
}

# macOS: Open Finder to the current directory on mac
.env$finder <- function(path = ".") {
    stopifnot(Sys.info()[[1L]] == "Darwin")
    stopifnot(is.character(path) && length(character) == 1L)
    system(paste("open", path))
}

.env$install <- function(...) {
    BiocManager::install(...)
}

.env$load_all <- function() {
    # pkgload::load_all(helpers = FALSE, attach_testthat = FALSE)
    devtools::load_all()
}

# macOS: Copy to clipboard
.env$pbcopy <- function(x) {
    stopifnot(Sys.info()[[1L]] == "Darwin")
    capture.output(x, file = pipe("pbcopy"))
}

.env$pkginstall <- function(..., dependencies = FALSE) {
    devtools::install(..., dependencies = dependencies)
}

.env$report <- function(...) {
    covr::report(...)
}

.env$run_examples <- function(...) {
    devtools::run_examples(...)
}

.env$test <- function(...) {
    devtools::test(...)
}

# Set seed for reproducibility =================================================
.env$seed <- 1454944673L
set.seed(.env$seed)

# R 3.5.1
# cat(head(.Random.seed), sep = "\n")
# 403
# 10
# 533838267
# 264765273
# -811729688
# 904799510

# Initilization at start of an R session =======================================
# help(topic = "Startup", package = "base")
.First <- function() {
    options(
        author = "Michael Steinbaugh",
        browserNLdisabled = TRUE,
        email = "mike@steinbaugh.com",
        menu.graphics = FALSE,  # Graphics dialogs always seem to crash R.
        showErrorCalls = TRUE,
        showWarnCalls = TRUE,
        warn = 1,
        warnPartialMatchAttr = TRUE,
        warnPartialMatchDollar = TRUE,
        warning.length = 8170  # 8170 is the maximum.
    )
    if (interactive()) {
        attach(.env)
        options(
            # crayon.enabled = TRUE
            # crayon.colors = 256
            # deparse.max.lines = 2L
            # install.packages.check.source = "no"
            # install.packages.compile.from.source = "binary"
            # Ncpus = 8L
            # prompt = "> "
            # readr.num_columns = 0L
            # readr.show_progress = FALSE
            # repos = try(BiocManager::repositories())
            # width = 100
            basejump.save.ext = "rds",
            continue = " ",  # Kill annoying "+".
            devtools.name = "Michael Steinbaugh",
            devtools.desc.author = 'person("Michael", "Steinbaugh", email = "mike@steinbaugh.com", role = c("aut", "cre"))',
            devtools.desc.license = "MIT",
            # Enable OAuth token generation using httr on a remote R server.
            # This is used by googlesheets, for example.
            httr_oob_default = TRUE,
            max.print = 1000L
        )
        if (identical(
            x = normalizePath(getwd()),
            y = normalizePath("~")
        )) {
            # Automatically update packages.
            # try(BiocManager::install(ask = TRUE))
            # suppressWarnings(utils::update.packages(ask = TRUE))
        }

        # Turn on completion of installed package names.
        utils::rc.settings(ipck = TRUE)

        cat(paste(
            "User Library:",
            normalizePath(Sys.getenv("R_LIBS_USER")),
            "",
            "Working Directory:",
            normalizePath(getwd()),
            "",
            "",
            sep = "\n"
        ))
    }
}

# Initilization at end of an R session =========================================
.Last <- function() {
    if (interactive()) {
        message("Goodbye at ", date(), "\n")
    }
}

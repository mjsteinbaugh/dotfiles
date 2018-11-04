# R startup profile
# 2018-11-04
#
# Tested on Linux, macOS, and Windows.
#
# Stephen Turner's profile:
# http://gettinggeneticsdone.blogspot.com/2013/07/customize-rprofile.html
#
# Jim Hester's profile:
# https://github.com/jimhester/dotfiles/blob/master/R/Rprofile
#
# Efficient R programming:
# https://csgillespie.github.io/efficientR/set-up.html

# Notes ========================================================================
# Don't set `stringsAsFactors = FALSE`. Code will be non-portable!

# If devtools runs into an unzip error, set this:
# unzip = "/usr/bin/unzip"

# Check compilers are installed ================================================
if (Sys.info()[["sysname"]] == "Darwin") {
    # macOS.
    # Using recommended CRAN compiler settings.
    stopifnot(identical(
        x = Sys.which(c("clang", "clang++", "gfortran")),
        y = c(
            "clang" = "/usr/local/clang6/bin/clang",
            "clang++" = "/usr/local/clang6/bin/clang++",
            "gfortran" = "/usr/local/gfortran/bin/gfortran"
        )
    ))
} else if (Sys.info()[["sysname"]] == "Linux") {
    # Linux.
    stopifnot(identical(
        x = Sys.which(c("gcc", "g++", "gfortran")),
        y = c(
            "gcc" = "/usr/bin/gcc",
            "g++" = "/usr/bin/g++",
            "gfortran" = "/usr/bin/gfortran"
        )
    ))
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

.env$build_reference_index <- function(...) {
    pkgdown::build_reference_index(...)
}

.env$build_site <- function(..., document = FALSE) {
    unlink("docs", recursive = TRUE)
    pkgdown::build_site(..., document = document)
}

.env$build_vignettes <- function(...) {
    devtools::build_vignettes(...)
}

.env$check <- function(
    ...,
    document = FALSE,
    vignettes = FALSE
) {
    devtools::check(
        ...,
        document = document,
        vignettes = vignettes
    )
    # This will error if directory doesn't match package name.
    # BiocCheck::BiocCheck(".")
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

# macOS: Open Finder to the current directory.
.env$finder <- function(path = ".") {
    stopifnot(Sys.info()[[1L]] == "Darwin")
    stopifnot(is.character(path) && length(character) == 1L)
    system(paste("open", path))
}

.env$install <- function(..., update = FALSE) {
    BiocManager::install(..., update = update)
}

.env$lint_package <- function(...) {
    lintr::lint_package(...)
}

# pkgload::load_all(helpers = FALSE, attach_testthat = FALSE)
.env$load_all <- function() {
    devtools::load_all()
}

# macOS: Copy to clipboard.
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

.env$run_examples <- function(..., fresh = TRUE) {
    devtools::run_examples(..., fresh = fresh)
}

.env$script_path <- function() {
    rstudioapi::getSourceEditorContext()$path
}

.env$test <- function(...) {
    require(testthat)
    require(patrick)
    devtools::test(...)
}

.env$valid <- function(...) {
    BiocManager::valid(...)
}

# Set seed for reproducibility =================================================
.env$seed <- 1454944673L
set.seed(.env$seed)

# R 3.5.1
# cat(head(.Random.seed, n = 3L), sep = "\n")
# 403
# 624
# 1853863629
# -1353004246

# Initilization at start of an R session =======================================
# help(topic = "Startup", package = "base")
.First <- function() {
    options(
        author = "Michael Steinbaugh",
        basejump.save.ext = "rds",
        browserNLdisabled = TRUE,
        email = "mike@steinbaugh.com",
        menu.graphics = FALSE,  # Graphics dialogs can crash R.
        showErrorCalls = TRUE,
        showWarnCalls = TRUE,
        warn = 1L
    )

    if (interactive()) {
        attach(.env)

        # Set general interactive options.
        options(
            # crayon.enabled = TRUE
            # crayon.colors = 256L
            # deparse.max.lines = 2L
            # install.packages.check.source = "no"
            # install.packages.compile.from.source = "binary"
            # Ncpus = 8L
            # prompt = "> "
            # readr.num_columns = 0L
            # readr.show_progress = FALSE
            # repos = BiocManager::repositories()
            # width = 100L
            continue = " ",  # Kill annoying "+" in console.
            devtools.name = "Michael Steinbaugh",
            devtools.desc.author = 'person("Michael", "Steinbaugh", email = "mike@steinbaugh.com", role = c("aut", "cre"))',
            devtools.desc.license = "MIT",
            # Enable OAuth token generation using httr on a remote R server.
            # This is used by googlesheets, for example.
            httr_oob_default = TRUE,
            max.print = 1000L
        )

        # Turn on completion of installed package names.
        utils::rc.settings(ipck = TRUE)

        # Check for developer environment.
        devel <- grepl("devel$", Sys.getenv("R_LIBS_USER"))

        # Set developer-specific profile.
        if (isTRUE(devel)) {
            # options(
            #     warnPartialMatchAttr = TRUE  # edgeR and pheatmap fail this.
            #     warnPartialMatchDollar = TRUE,
            #     warning.length = 8170L  # 8170 is the maximum.
            # )

            # Enable automatic package updates from home directory.
            if (identical(
                x = normalizePath(getwd()),
                y = normalizePath("~")
            )) {
                # Automatically update packages.
                # try(BiocManager::install(ask = TRUE))
                # suppressWarnings(utils::update.packages(ask = TRUE))
            }
        }

        # Check for developer library in git repos.
        if (
            grepl("/git/", getwd()) &&
            !isTRUE(devel)
        ) {
            warning("Developer library not detected.")
        }

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

# R startup profile
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
if (Sys.getenv("HMS_CLUSTER") == "o2") {
    # Use conda GCC instead of GCC 6 module.
    stopifnot(identical(
        x = Sys.which(c("gcc", "g++", "gfortran")),
        y = c(
            "gcc" = "/home/mjs65/miniconda3/envs/R-3.5.1-20181104/bin/gcc",
            "g++" = "/home/mjs65/miniconda3/envs/R-3.5.1-20181104/bin/g++",
            "gfortran" = "/home/mjs65/miniconda3/envs/R-3.5.1-20181104/bin/gfortran"
        )
    ))
} else if (Sys.info()[["sysname"]] == "Darwin") {
    # Use recommended CRAN compiler settings.
    stopifnot(identical(
        x = Sys.which(c("clang", "clang++", "gfortran")),
        y = c(
            "clang" = "/usr/local/clang6/bin/clang",
            "clang++" = "/usr/local/clang6/bin/clang++",
            "gfortran" = "/usr/local/gfortran/bin/gfortran"
        )
    ))
} else if (Sys.info()[["sysname"]] == "Linux") {
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
.bb8 <- new.env()

.bb8$bb8 <- function(...) {
    bb8::bb8(...)
}

.bb8$BiocCheck <- function(package = ".", ...) {
    BiocCheck::BiocCheck(package = package, ...)
}

.bb8$build_home <- function(...) {
    pkgdown::build_home(...)
}

.bb8$build_news <- function(...) {
    pkgdown::build_news(...)
}

.bb8$build_reference <- function(...) {
    pkgdown::build_reference(...)
}

.bb8$build_reference_index <- function(...) {
    pkgdown::build_reference_index(...)
}

.bb8$build_site <- function(..., document = FALSE) {
    unlink("docs", recursive = TRUE)
    pkgdown::build_site(..., document = document)
}

.bb8$build_vignettes <- function(...) {
    devtools::build_vignettes(...)
}

.bb8$catVec <- function(x) {
    x <- paste0("\"", x, "\"")
    x <- paste(x, collapse = ",\n")
    cat(x)
}

.bb8$check <- function(
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

.bb8$cd <- function(...) {
    base::setwd(...)
}

.bb8$clear <- function() {
    cat("\f")
}

.bb8$clearWarnings <- function() {
    assign("last.warning", NULL, envir = baseenv())
}

.bb8$document <- function(...) {
    devtools::document(...)
}

# macOS: Open Finder to the current directory.
.bb8$finder <- function(path = ".") {
    stopifnot(Sys.info()[[1L]] == "Darwin")
    stopifnot(is.character(path) && length(character) == 1L)
    system(paste("open", path))
}

.bb8$install <- function(..., update = FALSE) {
    BiocManager::install(..., update = update)
}

.bb8$lint_package <- function(...) {
    lintr::lint_package(...)
}

# pkgload::load_all(helpers = FALSE, attach_testthat = FALSE)
.bb8$load_all <- function() {
    devtools::load_all()
}

# Get free memory statistics.
# Currently this only works for Linux.
# help(topic = "Memory", package = "base")
# help(topic = "Memory-limits", package = "base")
# https://stackoverflow.com/a/6457769
# https://stackoverflow.com/a/29787527
# https://stat.ethz.ch/R-manual/R-devel/library/base/html/Memory-limits.html
# http://adv-r.had.co.nz/memory.html
# `utils:::format.object_size()``
# `print:::print.bytes()`
.bb8$memfree <- function() {
    message("Running garbage collection first with base::gc().")
    print(gc(verbose = TRUE, full = TRUE))
    mem_used <- capture.output(print(pryr::mem_used()))
    mem_free <- utils:::format.object_size(as.numeric(
        system("awk '/MemFree/ {print $2}' /proc/meminfo", intern = TRUE)
    ), "auto")
    message(paste0(
        "Memory used: ", mem_used, " (pryr::mem_used)\n",
        "Memory free: ", mem_free, " (awk MemFree)"
    ))
}

# macOS: Copy to clipboard.
.bb8$pbcopy <- function(x) {
    stopifnot(Sys.info()[[1L]] == "Darwin")
    capture.output(x, file = pipe("pbcopy"))
}

.bb8$pkginstall <- function(..., dependencies = FALSE) {
    devtools::install(..., dependencies = dependencies)
}

.bb8$report <- function(...) {
    # covr doesn't currently install DT but requires it for this function...
    library(DT)
    covr::report(...)
}

.bb8$run_examples <- function(..., fresh = TRUE) {
    devtools::run_examples(..., fresh = fresh)
}

.bb8$script_path <- function() {
    rstudioapi::getSourceEditorContext()$path
}

.bb8$test <- function(...) {
    require(testthat)
    require(patrick)
    devtools::test(...)
}

.bb8$valid <- function(...) {
    BiocManager::valid(...)
}

# Set seed for reproducibility =================================================
.bb8$seed <- 1454944673L
set.seed(.bb8$seed)

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
        basejump.save.dir = file.path("data", Sys.Date()),
        basejump.save.ext = "rds",
        browserNLdisabled = TRUE,
        email = "mike@steinbaugh.com",
        menu.graphics = FALSE,  # Graphics dialogs can crash R.
        showErrorCalls = TRUE,
        showWarnCalls = TRUE,
        warn = 1L
    )

    if (interactive()) {
        attach(.bb8)

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
        # if (
        #     grepl("/git/", getwd()) &&
        #     !isTRUE(devel)
        # ) {
        #     warning("Developer library not detected.")
        # }

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

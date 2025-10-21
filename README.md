<hr>

# OVERVIEW

A collection of bash scripts for various system tasks, executable directly via curl. No installation required, just run scripts on-demand for system administration, development setup, security configuration, and utility operations.

<hr>

# GUIDANCE

### Create ICNS for Tahoe

<img src=".assets/wrong.png" width="49.375%"/><img src=".assets/1x1.png" width="1.25%"><img src=".assets/right.png" width="49.375%"/>

Tahoe ICNS files need 10% padding, which many icons from [macOSicons](https://macosicons.com/) lack. This command generates a properly padded ICNS from a 1024×1024 PNG file, ideally exported from the [Icon Composer](https://developer.apple.com/icon-composer/) application.

```shell
curl -fsSL https://raw.githubusercontent.com/olankens/curlmate/HEAD/src/create-tahoe-icns.sh | bash
```

### Reset GitHub Repository

<img src=".assets/bloated.png" width="49.375%"/><img src=".assets/1x1.png" width="1.25%"><img src=".assets/reset.png" width="49.375%"/>

```shell
curl -fsSL https://raw.githubusercontent.com/olankens/curlmate/HEAD/src/reset-github-repository.sh | bash
```

### Simplify SVG files

<img src=".assets/not-simplified.png" width="49.375%"/><img src=".assets/1x1.png" width="1.25%"><img src=".assets/simplified.png" width="49.375%"/>

```shell
curl -fsSL https://raw.githubusercontent.com/olankens/curlmate/HEAD/src/simplify-svg-files.sh | bash
```

<hr>
